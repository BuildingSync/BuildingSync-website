# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import datetime

import openpyxl
import os
from django.contrib.auth.models import User
from django.db import models

from std211.lib.std211_to_bsxml import (
    getlabeledvalues,
    scan_for_cell_value,
    getlistinfo,
    getlist,
    LabelMismatch,
    energysources_labels,
    cellrange,
    scanForHeaderRow,
    eemsummary_header_er,
    eemsummary_header_yi,
    spacefunctions_labels,
    spacefunctions_211_labels,
    getinfo,
    map_to_buildingsync,
    prettystring,
)


class Standard211Instance(models.Model):
    owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    data_string = models.TextField()

    @staticmethod
    def spreadsheet_to_dictionary(filename):
        if os.path.exists(filename):
            workbook = openpyxl.load_workbook(filename)
        else:
            raise Exception("File does not exist: {}".format(filename))

        std211 = {}
        #
        # Read the 'All - Building sheet'
        #
        # The first several items are fixed in size and location, but
        # the "Space Function" table looks to be expandable. Everything
        # after that needs to be found.
        #
        wstitle = 'All - Building'
        ws = workbook[wstitle]
        # High level building information
        bldg_info = getlabeledvalues(ws, 'A3:B13')
        bldg_info.update(getlabeledvalues(ws, 'A19:B25'))
        bldg_info.update(getlabeledvalues(ws, 'E15:F22'))
        # Scrub any dates
        for key, value in bldg_info.items():
            if isinstance(value, datetime.datetime):
                bldg_info[key] = str(value)
        # Excluded space
        excluded_spaces = getlist(ws, 'E24:E26', variablelength=True)
        # Space Function
        space_function = getlabeledvalues(ws, 'A29:B33', variablelength=True,
                                          labelcolor=8)
        # Occupancy
        # Look for Occupancy*
        cellcol, cellrow = scan_for_cell_value(ws, mincol=1, minrow=34, maxcol=1,
                                               value='Occupancy*')
        # occupancy = getlabeledvalues(ws, 'A36:B40', hasunits=True)
        occupancy = getlabeledvalues(ws, [cellcol, cellrow + 1,
                                          cellcol, cellrow + 5], hasunits=True)
        # Energy Sources
        # Look for Energy Sources**
        cellcol, cellrow = scan_for_cell_value(ws, mincol=1, minrow=41, maxcol=1,
                                               value='Energy Sources**')
        cellrow += 1
        # Check the labels
        labels = cellrange(ws, mincol=cellcol, minrow=cellrow, maxcol=cellcol + 5,
                           maxrow=cellrow)
        if labels != energysources_labels:
            raise LabelMismatch('Mismatch in energy sources labels')
        cellrow += 1
        energy_sources = getlistinfo(ws, [cellcol, cellrow, cellcol + 5, None],
                                     variablelength=True, labels=labels,
                                     inrows=True, keepempty=False)
        # raise 'STOPSTOPSTOP'
        # energy_sources = getcellrange(ws, 'A44:F53')
        # Facility Description
        # Look for Facility Description - Notable Conditions
        cellcol, cellrow = scan_for_cell_value(ws, mincol=1, minrow=54, maxcol=1,
                                               value='Facility Description - Notable Conditions')
        description = ws.cell(column=cellcol, row=cellrow + 1).value

        # Package the data
        std211['All - Building'] = bldg_info
        std211['All - Building']['Occupancy'] = occupancy
        std211['All - Building']['Energy Sources'] = energy_sources
        std211['All - Building']['Facility Description'] = description
        std211['All - Building']['Space Function'] = space_function
        std211['All - Building']['Excluded Spaces'] = excluded_spaces

        #
        # Read the L1 - EEM Summary sheet
        #
        # This sheet is apparently two tables. Find one and then the other.
        wstitle = 'L1 - EEM Summary'
        ws = workbook[wstitle]

        # Find the first table
        row0 = scanForHeaderRow(ws, 1, 3, eemsummary_header_yi)

        # Find the second table
        row1 = scanForHeaderRow(ws, 1, row0 + 1, eemsummary_header_er)

        # Get the first table
        lowcost = getinfo(ws, [1, row0 + 1, len(eemsummary_header_yi), row1 - 1],
                          labels=eemsummary_header_yi)
        # Get the second table
        potentialcapital = getinfo(ws, [1, row1 + 1, len(eemsummary_header_er), None],
                                   labels=eemsummary_header_er)

        std211['L1 - EEM Summary'] = {}
        std211['L1 - EEM Summary']['Low-Cost and No-Cost Recommendations'] = lowcost
        std211['L1 - EEM Summary']['Potential Capital Recommendations'] = potentialcapital
        #
        # Read the All - Space Functions
        #
        # This sheet is basically one big table
        wstitle = 'All - Space Functions'
        ws = workbook[wstitle]

        # tbl = getcellrange(ws, 'A5:G15')
        # tbl = gettabular(ws, 1, 5, 7, 15)
        # Look for "Space Number" in the first column
        cellcol, cellrow = scan_for_cell_value(ws, mincol=1, minrow=1, maxcol=1,
                                               value='Space Number')

        # Check the labels
        labels = cellrange(ws, mincol=cellcol, minrow=cellrow, maxcol=cellcol,
                           maxrow=cellrow + len(spacefunctions_211_labels) - 1)
        if labels != spacefunctions_211_labels:
            raise LabelMismatch('Mismatch in space function labels')
        space_functions = getinfo(ws, [cellcol + 1, cellrow, None,
                                       cellrow + len(spacefunctions_211_labels) - 1],
                                  inrows=False, labels=spacefunctions_labels)
        std211['All - Space Functions'] = space_functions
        return std211

    @staticmethod
    def dictionary_to_xml(std211_dict):
        xml = map_to_buildingsync(std211_dict)
        return prettystring(xml).decode('utf-8')
