# BuildingSync Use Case Selection Tool

## Version 1.3.0

This version replaces the old `selection-tool` names with `buildingsync-website`.

## Version 1.2.0

## What's Changed

- updating validation workflow for large # errors and other small tweaks by @kflemin in https://github.com/BuildingSync/BuildingSync-website/pull/130
- updating use case process diagram and adding link to it from use case… by @kflemin in https://github.com/BuildingSync/BuildingSync-website/pull/131
- Update onboarding doc to v1.2 by @JieXiong9119 in https://github.com/BuildingSync/BuildingSync-website/pull/133
- adding example files by @kflemin in https://github.com/BuildingSync/BuildingSync-website/pull/135
- set 2.4.0 as default version by @kflemin in https://github.com/BuildingSync/BuildingSync-website/pull/137
- update references to website repo and ipynb by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/138
- share a link to a particular spot in the schema tree by @kflemin in https://github.com/BuildingSync/BuildingSync-website/pull/141
- Fix bsync links by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/143
- Paths to Example Files and Jupyter Notebook by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/144
- Update BEDES Mapping by @haneslinger in https://github.com/BuildingSync/BuildingSync-website/pull/146
- Add BEDES v2.5 mapping file by @haneslinger in https://github.com/BuildingSync/BuildingSync-website/pull/150
- example zip must be names example_files.zip by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/148
- fix link to bsync versioning by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/147
- Fix versions of examples by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/151
- Remove old prereleases by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/149
- remove constraint on bedes contraint by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/152
- BEDES fix by @kflemin in https://github.com/BuildingSync/BuildingSync-website/pull/157
- Fix validator file options by @haneslinger in https://github.com/BuildingSync/BuildingSync-website/pull/158
- Fix mistakes in enum mapping by @JieXiong9119 in https://github.com/BuildingSync/BuildingSync-website/pull/159
- edge case fix for type references enums and unions enums by @kflemin in https://github.com/BuildingSync/BuildingSync-website/pull/162
- workaround for example files dropdown by version by @kflemin in https://github.com/BuildingSync/BuildingSync-website/pull/164
- Bump django from 2.2.24 to 2.2.27 by @dependabot in https://github.com/BuildingSync/BuildingSync-website/pull/163
- link to python notebook as a markdown file by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/167
- increase bedes field sizes migration and update mapping by @kflemin in https://github.com/BuildingSync/BuildingSync-website/pull/166
- Bump django from 2.2.27 to 2.2.28 by @dependabot in https://github.com/BuildingSync/BuildingSync-website/pull/168
- move reference to correct year by @kflemin in https://github.com/BuildingSync/BuildingSync-website/pull/169
- Update website by @haneslinger in https://github.com/BuildingSync/BuildingSync-website/pull/171
- Major Improvements by @axelstudios in https://github.com/BuildingSync/BuildingSync-website/pull/172
- Updated Publications and lxml by @axelstudios in https://github.com/BuildingSync/BuildingSync-website/pull/173
- Upgrade to Python 3.7.10 by bumping alpine to 3.10 by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/175
- Update Python CI by @axelstudios in https://github.com/BuildingSync/BuildingSync-website/pull/174
- Updated Onboarding & Collaborators by @axelstudios in https://github.com/BuildingSync/BuildingSync-website/pull/176
- Fix onboarding header height by @axelstudios in https://github.com/BuildingSync/BuildingSync-website/pull/177
- Add BAE to tools by @haneslinger in https://github.com/BuildingSync/BuildingSync-website/pull/178
- Add warnings by @haneslinger in https://github.com/BuildingSync/BuildingSync-website/pull/180
- Release BuildingSync 2.5 by @JieXiong9119 in https://github.com/BuildingSync/BuildingSync-website/pull/181
- Update documentation for BuildingSync 2.5 by @JieXiong9119 in https://github.com/BuildingSync/BuildingSync-website/pull/182
- Update pre-commit and break out test dependencies by @nllong in https://github.com/BuildingSync/BuildingSync-website/pull/184

## New Contributors

- @haneslinger made their first contribution in https://github.com/BuildingSync/BuildingSync-website/pull/146
- @axelstudios made their first contribution in https://github.com/BuildingSync/BuildingSync-website/pull/172

**Full Changelog**: https://github.com/BuildingSync/BuildingSync-website/compare/v1.1.4...v1.2.0

## Version 1.1.4

Date Range: 06/15/2021 - 07/31/2021

- Update on-boarding document to Version 1.1
- Remove old method of deployment. Use docker-compose instead of Docker swarm now. `docker-compose -f docker-compose.prod.yml up --build`
- Update Python dependencies
- Replace old selection tool URLs
- Add contact page

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

- Parser changes to handle restriction by pattern
- Adding L000 OpenStudio Simulation use case and example files
- Dockerize TestSuite repository

Date Range: 12/21/20 - 03/26/20

## Version 1.1.0

Date Range: 11/19/19 - 12/20/19

Closed Issues and Features:

- Feature [#38](https://github.com/BuildingSync/selection-tool/issues/38), New Test Suite Page (<url>/examples)
- Feature [#22](https://github.com/BuildingSync/selection-tool/issues/22), Add selection-tool version to the webpage
- Fixed [#23](https://github.com/BuildingSync/selection-tool/issues/23), Support unusual characters in use case names
- Fixed [#25](https://github.com/BuildingSync/selection-tool/issues/25), test out script to generate permission schematron document
- Fixed [#31](https://github.com/BuildingSync/selection-tool/issues/31), Remove Bedes CSVs from repo
- Fixed [#32](https://github.com/BuildingSync/selection-tool/issues/32), Store XML example files for each schema version
- Fixed [#33](https://github.com/BuildingSync/selection-tool/issues/33), make schematron use case files downloadable on public use cases
- Fixed [#34](https://github.com/BuildingSync/selection-tool/issues/34), Document instructions for adding a new schema
- Fixed [#35](https://github.com/BuildingSync/selection-tool/issues/35), Rename Data Dictionary to Schema Viewer
- Fixed [#36](https://github.com/BuildingSync/selection-tool/issues/36), Rework home page
- Fixed [#37](https://github.com/BuildingSync/selection-tool/issues/37), change site name
- Fixed [#39](https://github.com/BuildingSync/selection-tool/issues/39), BEDES Email Address has raw python object

## Version 1.0

Date Range: Initial Commit - 11/15/19

- Official version 1.0 release of Use Case Selection Tool.
- See README.md for more details

Closed Issues and Features:

- Fixed [#11](https://github.com/BuildingSync/selection-tool/issues/11), Support Schematron
- Fixed [#13](https://github.com/BuildingSync/selection-tool/issues/13), Add BuildingSync Version 2.0-Prerelease
