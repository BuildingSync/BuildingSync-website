# BuildingSync Schema Viewer and Validator

[![Build Status](https://github.com/BuildingSync/BuildingSync-website/workflows/CI/badge.svg)](https://github.com/BuildingSync/BuildingSync-website)

This is the repository for the BuildingSync Validator web application.

## Installation

1. Clone the repository.
1. Setup python 3. You can use a virtual environment:
   ```bash
   pyenv install 3.6.5
   pyenv virtualenv 3.6.5 bsync-validator-3.6.5
   pyenv local bsync-validator-3.6.5
   ```
1. Install PostgreSQL server for local development (if desired)
   - Once installed, create your local database and user:
     ```bash
     psql -c 'DROP DATABASE bsync_validator;'
     psql -c 'CREATE DATABASE bsync_validator;'
     psql -c "CREATE USER bsync_validator WITH ENCRYPTED PASSWORD 'bsync_validator';"
     psql -c 'GRANT ALL PRIVILEGES ON DATABASE bsync_validator TO bsync_validator;'
     psql -c 'ALTER USER bsync_validator CREATEDB;'
     ```
1. Install Django and associated requirements:
   ```bash
   pip install -r requirements-test.txt
   ```
1. Initialize the database:
   ```bash
   python manage.py migrate
   ```
1. Create a superuser:
   ```bash
   python manage.py createsuperuser
   ```
1. Start the app:
   ```bash
   python manage.py runserver
   ```

## Local Development

- When making changes to models, run the following command to make migrations:

  ```bash
  python manage.py makemigrations
  python manage.py migrate
  ```

- To test schema import, you can run this command:
  ```bash
  python manage.py reset_schema --schema_version=1.0.0
  ```

**NOTE**: You will need to be _off_ the NREL VPN to import a schema, otherwise you'll get an error related to http://www.gbxml.org/schema}Area' as the gbXML schema cannot be imported when on the NREL VPN.

### Pre-commit

This project used `pre-commit <https://pre-commit.com/>`\_ to ensure code consistency. To enable pre-commit, run the following from the command line.

```bash
pip install pre-commit
pre-commit install
```

To run pre-commit against the files without calling git commit, then run the following. This is useful when cleaning up the repo before committing.

```bash
pre-commit run --all-files
```

### Testing

- To run test:

  ```bash
  ./manage.py test
  ```

- To calculate coverage:
  ```bash
  coverage run --source='.' manage.py test
  coverage report
  ```

### Pep

- Run the following command to clean up your code before committing:

```bash
autopep8 --in-place --aggressive --aggressive --recursive --max-line-length 100 --ignore E501,E402,W503,E731 --exclude=conf.py,structure.py .

tox -e flake8
```

## Usage

### BuildingSync Schema

The BuildingSync Schema Viewer can support multiple versions of the BuildingSync schema. Admin users can manage schemas from the Django Administration console. Click on the 'Admin' link in the top navigation bar to access the Django Administration pages.

To add a schema, specify the name, version, and schema file (XSD) to parse and save the record. The schema file will be parsed automatically. **NOTE**: You will need to be _off_ the NREL VPN to import a schema, otherwise you'll get an error related to http://www.gbxml.org/schema}Area' as the gbXML schema cannot be imported when on the NREL VPN.

To modify an existing schema, click on the edit link. If changes are made to the uploaded XSD schema file and re-uploaded, ensure that the 'schema parsed' checkbox is unchecked before saving the record. This will trigger the automatic schema parsing.

### Use Cases

Authenticated users can add private use cases to the BuildingSync Schema Viewer. Use cases are represented by a schematron file that defines a set of rules and patterns.

To add a use case, click on the 'Use Case' link in the top navigation bar, then click on the '+ New Use Case' button.
Select a name and a BuildingSync schema version. Select your use case definitions schematron file and upload, then click 'Submit'.

Once ready, contact a BuildingSync admin to make the use case public. Public use cases will be available on the 'Validator' page to validate XML files submitted by users.

Admin users: Find the use case in the Django Administration console and click the edit button. Check the 'Make public' checkbox and save.

### Validator

The validator page allows users to validate XMLs against the BuildingSync schema and its public use cases. It can be tried with selected example files, or custom XML files can be uploaded for validation.

#### Validator API

There is also a validator endpoint to validate XML files against the BuildingSync schema and its public use cases.

#### SINGLE XML

Request: POST to https://buildingsync.net/api/validate
Use form-data to specify the following parameters for schema version and XML file: `schema_version` and `file`.

Example Response:

```json
{
  "schema_version": "1.0.0",
  "validation_results": {
    "schema": {
      "valid": true,
      "schema_version": "1.0.0"
    },
    "use_cases": {
      "EXAMPLE USE CASE 1": {
        "valid": false,
        "errors": [
          {
            "path": "Audits.Audit.Sites.Site.Facilities.Facility.ConditionedFloorsAboveGrade",
            "message": "Required element not found"
          },
          {
            "path": "Audits.Audit.Sites.Site.Facilities.Facility.ConditionedFloorsBelowGrade",
            "message": "Required element not found"
          },
          {
            "path": "Audits.Audit.Sites.Site.Facilities.Facility.UnconditionedFloorsAboveGrade",
            "message": "Required element not found"
          }
        ]
      },
      "EXAMPLE USE CASE 2": {
        "valid": true
      }
    }
  },
  "success": true
}
```

#### ZIP with multiple XMLs

Request: POST to https://buildingsync.net/api/validate
Use form-data to specify the following parameters for schema version and XML file: `schema_version` and `file`.

Example Response:

```json
{
  "schema_version": "2.0.0",
  "all_files_valid": true,
  "validation_results": [
    {
      "file": "Example – A Valid Schema.xml",
      "results": {
        "schema": {
          "valid": true,
          "schema_version": "2.0.0"
        },
        "use_cases": {
          "LL87": {
            "valid": false,
            "errors": [
              "Usage: stron [schematron] [instance doc]",
              "undefined local variable or method `type' for main:Object"
            ],
            "infos": [],
            "warnings": []
          },
          "L000 OpenStudio Simulation": {
            "valid": false,
            "errors": [
              "Usage: stron [schematron] [instance doc]",
              "undefined local variable or method `type' for main:Object"
            ],
            "infos": [],
            "warnings": []
          }
        }
      }
    },
    {
      "file": "Example – Valid Schema Invalid UseCase.xml",
      "results": {
        "schema": {
          "valid": true,
          "schema_version": "2.0.0"
        },
        "use_cases": {
          "LL87": {
            "valid": false,
            "errors": [
              "Usage: stron [schematron] [instance doc]",
              "undefined local variable or method `type' for main:Object"
            ],
            "infos": [],
            "warnings": []
          },
          "L000 OpenStudio Simulation": {
            "valid": false,
            "errors": [
              "Usage: stron [schematron] [instance doc]",
              "undefined local variable or method `type' for main:Object"
            ],
            "infos": [],
            "warnings": []
          }
        }
      }
    }
  ],
  "success": true
}
```

### BEDES

BEDES parsing and mapping to the BuildingSync schema is not an automated process, due to the manual inspections/corrections required.

To parse and map a new BEDES version:

1. Download the `bedes_online_dictionary_uuid-lo.xml` and the `bedes_online_dictionary_uuid-terms.xml` files from the BEDES website.

1. Place these new BEDES XMLs in the lib/bedes/vX.X directory. vX.X refers to the BEDES version here.

1. Parse the BEDES XMLs into a JSON file and map the BEDES terms to the BuildingSync attributes:

   ```bash
   docker exec -it buildingsyncwebsite_web_1 bash
   python manage.py bedes --schema_version=X.X.X --bedes_version=X.X
   ```

   Note that the bedes_version contains a v, ex: v2.2.
   This will create a bedes_vX.X.json`file in the lib/bedes/vX.X directory. It will also create 2 CSV files:`bedes-mappings-enumerations.csv`and`bedes-mappings-terms.csv` in the lib/bedes/vX.X/schemaX.X directory.

   _Note_ &mdash; The BEDES terms must be mapped for each version of the BuildingSync schema by calling the python manage.py bedes` command above.

1. Copy the generated bedes files to the git repo on the production server. The command will be something like:

   ```
   docker cp buildingsyncwebsite_web_1:/srv/selection-tool/bsyncviewer/lib/bedes/v2.5/schema2.5.0 .
   ```

1. Review these mapping files and make changes as needed. Commit and push the files to the BuildingSync-website repository (ideally a branch).

1. Once satisfied with the mappings, run the same command with the --save_to_db flag:
   ```bash
   python manage.py bedes --schema_version=X.X.X --bedes_version=X.X --save_to_db
   ```
   Note that you must run this command without the --save_to_db flag first, in order to create the CSV files.

### Admin Interface

Login to the admin interface at `/user/login`
Admin interface is available at `/admin`

### Adding a new BuildingSync Schema Version

Follow these steps to add a new schema version to the selection tool:

1. Add the schema file in the admin interface. Must have admin privileges. The schema will get automatically parsed. Manually add the enumeration.json file created from the release, hit the "Save" button once and wait patiently until it shows success.
2. Update the versions in the DEFAULT_SCHEMA_VERSION in the dev.py, gh_actions.py, and docker.py with the latest release.
3. Convert existing use cases schematron files to the new schema. Add the new use cases.
4. When the use cases have been reviewed, make them public in the admin interface. Add the schematron file and hit "Save" once and wait for each use case.
5. Create XML example files and place them in the `bsyncviewer/lib/validator/examples/schema<VERSION>` directory. Make sure that the example_files.zip file is updated if any of the example files have changed (This is likely since the new example files will be pointing to the new schema).
6. Test the validator with a local new XML example file.
7. Reparse BEDES terms to map them to the new schema following the steps in the BEDES section above.
8. Deploy website on production

### Adding Examples from the TestSuite repo

Follow these steps to add new example tables from the TestSuite repo

1. Clone the [TestSuite](https://github.com/BuildingSync/TestSuite) repo
2. Install [pandoc](https://pandoc.org/installing.html)
3. Convert the TestSuite README to html:
   `pandoc README.md -s -o README.html`
4. Copy the tables part of the README.html and paste to replace the old content in `bsyncviewer/templates/examples.html`.

### Adding an OpenStudio Simulation Use Case from the TestSuite repo

1. The relevant files are currently on the `develop` branch of the [TestSuite](https://github.com/BuildingSync/TestSuite/tree/develop) repo. Clone the repo locally.
1. OpenStudio Simulation use case schematron files include patterns from a [library of schematron files](https://github.com/BuildingSync/TestSuite/tree/develop/lib). Copy these files from the TestSuite repo into the selection-tool at the following location: `bsyncviewer/testsuitelib`.
1. Open the relevant use case file from the TestSuite repo. For example: [L00_OpenStudio_Simulation.sch](https://github.com/BuildingSync/TestSuite/blob/develop/schematron/v2.2.0/v2-2-0_L000_OpenStudio_Simulation.sch). Edit the include statements at the top of the file with relative paths to the buildingsync-website testsuitelib directory. Save the file.
   ```bash
     <include href="../../testsuitelib/rootElements.sch#root.oneOfEachUntilBuilding"/>
     <include href="../../testsuitelib/rootElements.sch#root.oneOfEachFacilityUntilScenario"/>
     <include href="../../testsuitelib/siteBuildingElements.sch#sbe.cityStateOrClimateZone"/>
     <include href="../../testsuitelib/scenarioElements.sch#sc.baseline.ID"/>
     <include href="../../testsuitelib/scenarioElements.sch#sc.baseline.asPackageOfMeasures"/>
     <include href="../../testsuitelib/buildingElements.sch#be.L000BuildingInfo"/>
     <include href="../../testsuitelib/floorElements.sch#fa.oneOfType"/>
     <include href="../../testsuitelib/floorElements.sch#fa.haveTypeAndValue"/>
   ```
1. Add the use case to the selection-tool by browsing to the `/use_cases` URL and clicking the _New Use Case_ button.
   1. Fill out the name, description, and schema version
   1. Upload the file that was modified in the previous step
   1. Save
1. Make the use case public from the selection-tool admin interface.
1. If you have any example files to add to the selection-tool (for example, for the L000 OpenStudio Simulation use case, there are [2 examples files](https://github.com/BuildingSync/TestSuite/tree/develop/spec/use_cases/schema2.0.0/examples)), add them in the appropriate schema directory in `bsyncviewer/lib/validator/examples`. Regenerate the `example_files.zip` archive. This will make the files available as examples at the `/validator` URL.
1. You can now validate XMLs against the new use case.
