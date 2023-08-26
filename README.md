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
- https://github.com/lubuntu-team/calamares-settings-ubuntu/tree/ubuntu/kinetic/debian
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

```bash
# create dir for this work
rm -rf calamares
mkdir -p calamares
cd calamares
# download sources from github
wget https://github.com/calamares/calamares/releases/download/v3.2.49.1/calamares-3.2.49.1.tar.gz
# untar it
tar xvpf calamares-3.2.49.1.tar.gz
cd calamares-3.2.49.1
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DWITH_PYTHONQT=ON -DAppStreamQt_DIR=... .. 
```