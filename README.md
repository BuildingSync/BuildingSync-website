# BuildingSync Schema Viewer and Validator

[![Build Status](https://travis-ci.org/BuildingSync/selection-tool.svg?branch=develop)](https://travis-ci.org/BuildingSync/selection-tool)

This is the repository for the BuildingSync Validator web application. 

## Installation

1. Clone the repository.
1. Setup python 3.  You can use a virtual environment:
    ```bash
    pyenv install 3.6.5 
    pyenv virtualenv 3.6.5 bsync-validator-3.6.5
    pyenv local bsync-validator-3.6.3
    ```   
1. Install PostgreSQL server for local development (if desired)
	* Once installed, create your local database and user:
		```bash
		psql -c 'DROP DATABASE bsync_validator;'
		psql -c 'CREATE DATABASE bsync_validator;'
		psql -c "CREATE USER bsync_validator WITH ENCRYPTED PASSWORD 'bsync_validator';"
		psql -c 'GRANT ALL PRIVILEGES ON DATABASE bsync_validator TO bsync_validator;'
		psql -c 'ALTER USER bsync_validator CREATEDB;'
		```
1. Install Django and associated requirements:
	```bash
	pip install -r requirements.txt
	```
1.  Initialize the database:
	```bash
	python manage.py migrate
	```
1.  Create a superuser:
	```bash
	python manage.py createsuperuser
	```
1. Start the app:
	```bash
	python manage.py runserver
	```


## Local Development

* When making changes to models, run the following command to make migrations:
	```bash
	python manage.py makemigrations
	python manage.py migrate
	```

* To test schema import, you can run this command:
	```bash
	python manage.py reset_schema --schema_version=1.0.0
	```


### Testing

* To run test:
   ```bash
   ./manage.py test
   ```

* To calculate coverage:
    ```bash
    coverage run --source='.' manage.py test
    coverage report
    ```

### Pep

* Run the following command to clean-up your code before committing:
```bash
autopep8 --in-place --aggressive --aggressive --recursive --max-line-length 100 --ignore E501,E402,W503,E731 --exclude=conf.py,structure.py .

tox -e flake8
```

## Usage

### BuildingSync Schema

The BuildingSync Schema Viewer can support multiple versions of the BuildingSync schema.  Admin users can manage schemas from the Django Administration console.  Click on the 'Admin' link in the top navigation bar to access the Django Administration pages.

To add a schema, specify the name, version, and schema file (XSD) to parse and save the record.  The schema file will be parsed automatically.

To modify an existing schema, click on the edit link.  If changes are made to the uploaded XSD schema file and re-uploaded, ensure that the 'schema parsed' checkbox is unchecked before saving the record.  This will trigger the automatic schema parsing.

### Use Cases

Authenticated users can add private use cases to the BuildingSync Schema Viewer.  Use cases are represented by a schematron file that defines a set of rules and patterns.

To add a use case, click on the 'Use Case' link in the top navigation bar, then click on the '+ New Use Case' button.
Select a name and a BuildingSync schema version.  Select your use case definitions schematron file and upload, then click 'Submit'.  

Once ready, contact a BuildingSync admin to make the use case public. Public use cases will be available on the 'Validator' page to validate XML files submitted by users.

Admin users: Find the use case in the Django Administration console and click the edit button.  Check the 'Make public' checkbox and save.

### Validator

The validator page allows users to validate XMLs against the BuildingSync schema and its public use cases.  It can be tried with selected example files, or custom XML files can be uploaded for validation.

#### Validator API

There is also a validator endpoint to validate XML files against the BuildingSync schema and its public use cases.

Request: POST to https://selectiontool.buildingsync.net/api/validate
Use form-data to specify the following parameters for schema version and XML file:  ```schema_version``` and ```file```.

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

### BEDES

BEDES parsing and mapping to the BuildingSync schema is not an automated process, due to the manual inspections/corrections required.

To parse and map a new BEDES version:

1. Download the ```bedes_online_dictionary_uuid-lo.xml``` and the ```bedes_online_dictionary_uuid-terms.xml``` files from the BEDES website.

1. Place these new BEDES XMLs in the lib/bedes/vX.X directory.  vX.X refers to the BEDES version here.

1. Parse the BEDES XMLs into a JSON file and map the BEDES terms to the BuildingSync attributes:
    ```bash
    python manage.py bedes --schema_version=X.X.X --bedes_version=X.X
    ```
    Note that the bedes_version contains a v, ex: v2.2.
    This will create a ```bedes_vX.X.json``` file in the lib/bedes/vX.X directory.  It will also create 2 CSV files:  ```bedes-mappings-enumerations.csv``` and ```bedes-mappings-terms.csv``` in the lib/bedes/vX.X/schemaX.X directory.

    *Note* &mdash; The BEDES terms must be mapped for each version of the BuildingSync schema by calling the ```python manage.py bedes``` command above.

1. Review these mapping files and make changes as needed.

1. Once satisfied with the mappings, run the same command with the --save_to_db flag:
    ```bash
    python manage.py bedes --schema_version=X.X.X --bedes_version=X.X --save_to_db
    ```
    Note that you must run this command without the --save_to_db flag first, in order to create the CSV files.

### Adding a new BuildingSync Schema Version

Follow these steps to add a new schema version to the selection tool:

1. Add the schema file in the admin interface.  Must have admin privileges.  The schema will get automatically parsed.
1. Convert existing use cases schematron files to the new schema.  Add the new use cases.
1. When the use cases have been reviewed, make them public in the admin interface.
1. Create XML example files and place them in the `lib/validator/examples/schema<VERSION>` directory. 
1. Test the validator with the new XML example files.
1. Reparse bedes terms to map them to the new schema following the steps in the BEDES section above.

### Adding Examples from the TestSuite

Follow these steps to add new example tables from the TestSuite

1. Clone the [TestSuite](https://github.com/BuildingSync/TestSuite) repo
2. Install [pandoc](https://pandoc.org/installing.html)
3. Convert the TestSuite README to html:
    ``` pandoc README.md -s -o README.html ```
4. Copy the tables part of the README.html and paste to replace the old content in ```bsyncviewer/templates/examples.html```.
