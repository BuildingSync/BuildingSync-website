BuildingSync Tool
=================

This repo holds the Django-backed, Angular-fronted website for my BuildingSync to SEED tool work.

Testing |tstimage|_
-------------------

The source is tested using the Django's test framework (based on unittest). To find and execute all
the unit tests, just execute ``python manage.py test``. The tests are automatically executed by `Travis
CI <https://travis-ci.org/myoldmopar/bs-tool>`__.

Code Coverage |covimage|_
-------------------------

After testing is complete, the code coverage status for those tests are tracked on
`Coveralls <https://coveralls.io/github/myoldmopar/bs-tool?branch=master>`__.

.. |tstimage| image:: https://travis-ci.org/myoldmopar/bs-tool.svg?branch=master
.. _tstimage: https://travis-ci.org/myoldmopar/bs-tool

.. |covimage| image:: https://coveralls.io/repos/github/myoldmopar/bs-tool/badge.svg?branch=master
.. _covimage: https://coveralls.io/github/myoldmopar/bs-tool?branch=master
