#CHANGELOG

### Release v1.1.5 (September 29, 2019)
- Change ownership of default texture pack
- Switch to runuser from sudo so that user home folder is included in environment

### Release v1.1.4 (September 29, 2019)
- Ensure mcov home folder is created
- Change location of default texture pack

### Release v1.1.3 (September 29, 2019)
- Corrected typo in groupadd command

### Release v1.1.2 (September 29, 2019)
- Allow for timezone setting
- Create mcov (1000) user and group
- Run nginx as mcov user
- Run overviewer render as mcov user

### Release v1.1.1 (September 26, 2019)
- Minor corrections to the overviewer config
- Changed the observer for overviewer to JSObserver
- Moved the html file to the _/ov_ volume

### Release v1.1.0 (September 25, 2019)
- Moved the default texture download into the build
- consolidated configuration items into _/ov_ volume to allow host edits of overviewer config.py
- change entrypoint.sh to start
- updated documentation

### Release v1.0.2 (September 23, 2019)
- Moved nginx startup from the Dockerfile (build) to the entrypoint script (run)

### Release v1.0.1 (September 23, 2019)
- Moved the custom files ADD down in the docker sequence
- Added step to make entrypoint.sh executable
- Corrected syntax of ENTRYPOINT

### Release v1.0.0 (September 22, 2019)
- Initial release
