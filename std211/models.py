# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.models import User
from django.db import models


class Standard211Instance(models.Model):
    owner = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    data_string = models.TextField()

    @staticmethod
    def spreadsheet_to_dictionary(spreadsheet_instance):
        # validate spreadsheet
        # do some more stuff
        # return some dictionary
        return {'status': 'success', 'data': '42'}

    @staticmethod
    def dictionary_to_xml(std211_dictionary):
        # validate the dictionary
        # do some more stuff
        # return XML string? File?
        return "<cool>xml</cool>"
