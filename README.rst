BuildingSync Tool
=================

This repo is the Django-backed, Angular-fronted website for my BuildingSync to SEED tool work.  The

Testing |tstimage|_
-------------------

The source is tested using Django's test framework (based on unittest). To find and execute all
the unit tests, just execute ``python manage.py test``. The tests are automatically executed by `Travis
CI <https://travis-ci.org/myoldmopar/bs-tool>`__.

Code Coverage |covimage|_
-------------------------

After testing is complete, the code coverage status for those tests are tracked on
`Coveralls <https://coveralls.io/github/myoldmopar/bs-tool?branch=master>`__.

.. |tstimage| image:: https://travis-ci.org/Myoldmopar/bs-tool.svg?branch=master
.. _tstimage: https://travis-ci.org/Myoldmopar/bs-tool

.. |covimage| image:: https://coveralls.io/repos/github/Myoldmopar/bs-tool/badge.svg?branch=master
.. _covimage: https://coveralls.io/github/Myoldmopar/bs-tool?branch=master

Deployment Instructions
-----------------------

Deployed on `Heroku <https://buildingsynctool.herokuapps.com>`__.  Here are some getting started steps:

- You'll need some very typical dependencies: Git, Python 2.7, Node

- Clone this repo to a local directory: `git clone https://github.com/Myoldmopar/bs-tool`.

- If you are operating in a virtual environment, then make a new one of those: `mkvirtualenv bstool`; it should automatically do a `workon bstool` for you, so you are good to continue.

- From the repo root, install some dependencies:

  - `pip install -r requirements.txt`  -- This will install all the Python dependencies, including Django.
  - `npm install`  -- This will install the "Node" dependencies, which is really only Bower
  - `bower install`  -- This will install all the Bower dependencies, which are quite a few JavaScript/CSS libraries

- Now prep to start the server:

  - `python manage.py migrate`  -- This will instantiate the database and create empty tables
  - `python manage.py create_schema`  -- This management command is custom for this project and parses a schema file to populate the database
  - `python manage.py createsuperuser`  -- This creates an admin user, you can also `create_default_user` if you'd like
  - `python manage.py runserver`  -- This will run the server and make it available, by default, in your `browser <https://127.0.0.1:8000>`__.
