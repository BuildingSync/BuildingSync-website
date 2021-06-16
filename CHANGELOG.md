# BuildingSync Use Case Selection Tool

## Version 1.1.3

Date Range: 06/03/20 - 06/15/21

Updates:

- Renamed master to main
- Install testsuite from PyPi
- Bump lxml to 4.6.2
- BSync version 2.3.0 with updated example files
- Django 2.2.20
- Backup Script
- Add L200 audit example file
- Accept Zip of BuildingSync files for validation

## Version 1.1.2

Date Range: 03/26/20 - 06/02/20

Updates:

- Replaced schematron-nokogiri (and ruby dependency) with lxml for better error message when validating XMLs
- Updates to L000 use case and associated files
- Validator API now accepts zip files of XMLs for validation against a schema version and associated use cases
- Added information to bedes enumeration CSV export to link enums back to their associated attributes

## Version 1.1.1

General updates:

* Parser changes to handle restriction by pattern
* Adding L000 OpenStudio Simulation use case and example files
* Dockerize TestSuite repository

Date Range: 12/21/20 - 03/26/20


## Version 1.1.0

Date Range: 11/19/19 - 12/20/19

Closed Issues and Features:
- Feature [#38]( https://github.com/BuildingSync/selection-tool/issues/38 ), New Test Suite Page (<url>/examples)
- Feature [#22]( https://github.com/BuildingSync/selection-tool/issues/22 ), Add selection-tool version to the webpage
- Fixed [#23]( https://github.com/BuildingSync/selection-tool/issues/23 ), Support unusual characters in use case names
- Fixed [#25]( https://github.com/BuildingSync/selection-tool/issues/25 ), test out script to generate permission schematron document
- Fixed [#31]( https://github.com/BuildingSync/selection-tool/issues/31 ), Remove Bedes CSVs from repo
- Fixed [#32]( https://github.com/BuildingSync/selection-tool/issues/32 ), Store XML example files for each schema version
- Fixed [#33]( https://github.com/BuildingSync/selection-tool/issues/33 ), make schematron use case files downloadable on public use cases
- Fixed [#34]( https://github.com/BuildingSync/selection-tool/issues/34 ), Document instructions for adding a new schema
- Fixed [#35]( https://github.com/BuildingSync/selection-tool/issues/35 ), Rename Data Dictionary to Schema Viewer
- Fixed [#36]( https://github.com/BuildingSync/selection-tool/issues/36 ), Rework home page
- Fixed [#37]( https://github.com/BuildingSync/selection-tool/issues/37 ), change site name
- Fixed [#39]( https://github.com/BuildingSync/selection-tool/issues/39 ), BEDES Email Address has raw python object

## Version 1.0

Date Range: Initial Commit - 11/15/19

- Official version 1.0 release of Use Case Selection Tool.
- See README.md for more details

Closed Issues and Features:
- Fixed [#11]( https://github.com/BuildingSync/selection-tool/issues/11 ), Support Schematron
- Fixed [#13]( https://github.com/BuildingSync/selection-tool/issues/13 ), Add BuildingSync Version 2.0-Prerelease
