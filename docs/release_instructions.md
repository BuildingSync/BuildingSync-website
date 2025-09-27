# Release Instructions

Follow the list below for a new release:

1. Copy the corresponding schema file into `bsyncviewer/lib/buildingsync_schemas/` and rename it
2. Create a branch for the release prep (e.g., `release/v1.3.0-prep`)
3. Update version file (/app_version.txt). Update version to next appropriate version. Always use MAJOR.MINOR.RELEASE.
4. Run `pre-commit run --all-files` locally, and commit changes.
5. Within GitHub, draft a new release and autogenerate the change log (https://github.com/BuildingSync/BuildingSync-website/releases). Copy the changes into the CHANGELOG.md file. Clean up any items that are not relevant to the release.
6. Create a PR from the release prep branch to develop. Request reviews and merge once approved.
7. From command line, merge latest develop into latest main `git checkout main; git pull; git merge --ff-only origin develop`. This will point the HEAD of main to latest develop. Then push the main branch to GitHub with `git push`, which may require a developer with elevated privileges to push to main.
8. Back on GitHub create a new tag in GitHub against main and copy the change log notes into the tag description.
