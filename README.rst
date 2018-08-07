BuildingSync Tool
=================

This repo is the Django-backed, Angular-fronted website for my BuildingSync to SEED tool work.

Testing |tstimage|_
-------------------

The source is tested using Django's test framework (based on unittest). To find and execute all
the unit tests, just execute ``python manage.py test``. The tests are automatically executed by `Travis
CI <https://travis-ci.org/BuildingSync/selection-tool>`__.

Code Coverage |covimage|_
-------------------------

After testing is complete, the code coverage status for those tests are tracked on
`Coveralls <https://coveralls.io/github/BuildingSync/selection-tool?branch=master>`__.

.. |tstimage| image:: https://travis-ci.org/BuildingSync/selection-tool.svg?branch=develop
.. _tstimage: https://travis-ci.org/BuildingSync/selection-tool

.. |covimage| image:: https://coveralls.io/repos/github/BuildingSync/selection-tool/badge.svg?branch=master
.. _covimage: https://coveralls.io/github/BuildingSync/selection-tool?branch=master

Deployment Instructions
-----------------------

Deploy with Docker. Instructions to follow.
