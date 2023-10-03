# Release Instructions

Follow the list below for a new release:

1. Copy the corresponding schema file into ``bsyncviewer/lib/buildingsync_schemas/`` and rename it
2. Update version file (/app_version.txt). Update version to next appropriate version. Always use MAJOR.MINOR.RELEASE.
3. Create a draft release on GitHub and autogenerate the changelog via the website. Copy and paste the updates into the CHANGELOG.md.
4. Merge the changes into develop and once develop passes, create a new PR from develop to main.
5. Draft new Release from Github (https://github.com/BuildingSync/BuildingSync-website/releases). Include list of changes since previous release (i.e., the content in the CHANGELOG.md)
