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

The `cmake` command is used to configure the build process for software projects. It generates build files that are specific to your system and the options you provide. In the context of building Calamares, this command is used to generate the necessary build files before compiling the source code into executable binaries.

Let's break down the command you provided:

1. `cmake`: This is the command itself, used to invoke the CMake build system.

2. `-DCMAKE_BUILD_TYPE=Release`: This option sets the build type to "Release." In CMake, different build types can have different compiler optimization settings and debugging information. "Release" typically optimizes the code for performance without including extensive debugging information.

3. `-DCMAKE_INSTALL_PREFIX=/usr`: This option sets the installation prefix to `/usr`. This means that the compiled binaries, libraries, and other files will be installed under the `/usr` directory hierarchy on the target system.

4. `-DWITH_PYTHONQT=ON`: This option enables the building of Calamares with support for PythonQt. PythonQt is a library that allows you to use Python code from within C++ applications and vice versa.

5. `-DAppStreamQt_DIR=...`: This option specifies the location of the CMake configuration files for the AppStreamQt library. AppStreamQt is a library that provides support for AppStream metadata, which is used to describe software components in Linux distributions.

6. `..`: This indicates the path to the source directory of the Calamares project. The `..` means that the build files will be generated in the parent directory of the current working directory.

When you run this `cmake` command, it processes the `CMakeLists.txt` files in the Calamares source directory and generates the appropriate build files according to the options you've specified. These build files might be Makefiles, Visual Studio project files, or other format-specific files.

After running `cmake`, you would typically follow up with the actual build command (such as `make` on Linux) to compile the source code and generate the executable binaries. Additionally, you might use the `make install` command to install the compiled binaries, libraries, and other files to the installation directory you specified with the `-DCMAKE_INSTALL_PREFIX` option.

Remember that this explanation provides a general overview of the `cmake` command and the options you've used. The exact behavior might vary depending on the project's structure and the CMake configuration used by the project maintainers. Always refer to the project's documentation for specific details.