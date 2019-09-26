#CHANGELOG

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
