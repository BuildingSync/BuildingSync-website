# BuildingSync Schema Viewer and Validator

[![Build Status](https://travis-ci.org/BuildingSync/selection-tool.svg?branch=develop)](https://travis-ci.org/BuildingSync/selection-tool)

This is the repository for the BuildingSync Validator web application. 

## Installation

1. Clone the repository.
1. Setup python 3.  You can use a virtual environment:
    ```bash
    pyenv install 3.6.5 
    pyenv virtualenv 3.6.5 bs-validator-3.6.5
    pyenv local bs-validator-3.6.3
    ```   
1. Install PostgreSQL server for local development (if desired)
	1. Once installed, create your local database and user:
		```bash
		psql -c 'DROP DATABASE bs_validator;'
		psql -c 'CREATE DATABASE bs_validator;'
		psql -c "CREATE USER bs_validator WITH ENCRYPTED PASSWORD 'bs_validator';"
		psql -c 'GRANT ALL PRIVILEGES ON DATABASE bs_validator TO bs_validator;'
		psql -c 'ALTER USER bs_validator CREATEDB;'
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
	python manage.py makemigrations <appname>
	python manage.py migrate
	```

* To test schema import, you can run this command:
	```bash
	python manage.py reset_schema --schema_version=0.3
	```


## Testing

* To run test:
   ```bash
   ./manage.py test
   ```

* To calculate coverage:
    ```bash
    coverage run --source='.' manage.py test
    coverage report
    ```

## Usage

### BuildingSync Schema

The BuildingSync Schema Viewer can support multiple versions of the BuildingSync schema.  Admin users can manage schemas from the Django Administration console.  Click on the 'Admin' link in the top navigation bar to access the Django Administration pages.
To add a schema, specify the name, version, and schema file (XSD) to parse and save the record.  The schema file will be parsed automatically and a use case template (CSV) file will be generated.
This template file can then be used by users to upload their particular use case in a format that can be consumed by this tool.

To modify an existing schema, click on the edit link.  If changes are made to the uploaded XSD schema file and re-uploaded, ensure that the 'schema parsed' checkbox is unchecked before saving the record.  This will trigger the automatic schema parsing.


### Use Cases

Authenticated users can add private use cases to the BuildingSync Schema Viewer. To add a use case, click on the 'Use Case' link in the top navigation bar, then click on the '+ New Use Case' button.
Select a name and a BuildingSync schema version and click 'Submit'.  Once the schema version is set, a Use Case Template will be available for download from the Use Cases page, or from the Edit page.  Download the CSV template, fill it out with the details of the use case,
and upload it to the 'Import File' field of the use case form. Click 'Submit'.  Once the file is submitted, the use case will be automatically parsed.  Parsing errors, if any, will be displayed on the use case page.

Once ready, contact a BuildingSync admin to make the use case public. Public use cases will be available on the 'Validator' page to validate XML files submitted by users.
Admin users: Find the use case in the Django Administration console and click the edit button.  Check the 'Make public' checkbox and save.