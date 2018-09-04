# BuildingSync Selection Tool and Validator

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



