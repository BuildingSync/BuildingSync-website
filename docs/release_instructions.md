# Release Instructions

Follow the list below for a new release:

1. Copy the corresponding schema file into `bsyncviewer/lib/buildingsync_schemas/` and rename it
2. Update version file (/app_version.txt). Update version to next appropriate version. Always use MAJOR.MINOR.RELEASE.
3. Run the `docs/scripts/change_log.py` script and add the changes to the CHANGELOG.md file for the range of time between last release and this release. Only add the _Closed Issues_. Also make sure that all the pull requests have a related Issue in order to be included in the change log.

```
python docs/scripts/change_log.py –k GITHUB_API_TOKEN –s 2018-02-26 –e 2018-05-30
```

3. Paste the results (remove unneeded Accepted Pull Requests) into the CHANGELOG.md. Make sure to cleanup the formatting if needed.
4. Once develop passes, then create a new PR from develop to main.
5. Draft new Release from Github (https://github.com/BuildingSync/BuildingSync-website/releases). Include list of changes since previous release (i.e., the content in the CHANGELOG.md)
