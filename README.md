# MSM linux calamares configs
- settings.conf holds all the config how execute everything

### Build instruction
build-dep: debhelper
```bash
chmod +x ./build/build.sh
    #### customise the variables to your liking in build.sh
./build.sh
```

### Note
- to test calamares config run ```calamares -d``` in the ```root``` of the folder
- customise *.desc(branding) files and *.conf files
- update changelog (using a script)/ currently edit template
### Location of files to be placed
    settings.conf => /etc/calamares/settings.conf
    src/modules/* => /etc/calamares/modules/*
    src/branding/* => /etc/calamares/branding/*


### Reminder
- add calamares as a dependency in control file for packaging
- create a bash script that copies the files and places them into a bundle to be packaged into a .deb 

### Current errors:

### Bookmarks
    https://youtu.be/L91iAquEopc
