# MATLAB Library System

[![Version](https://img.shields.io/badge/version-v2.1-green.svg?style=flat)](https://github.com/tiborsimon/MATLAB-Library-System/releases/latest)
[![Article](https://img.shields.io/badge/article-read-blue.svg?style=flat)](http://tiborsimon.github.io/programming/matlab-library-system/)
[![Discussion](https://img.shields.io/badge/discussion-join-orange.svg?style=flat)](http://tiborsimon.github.io/programming/matlab-library-system/#discussion)
[![The MIT License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](#license)

Library handling module that makes shipment and adding/removing MATLAB scripts and functions convenient for you and your customers.

## Using the system

### Manual way

1. Create a new folder that will be the root folder of your project.
1. Copy the content of this repository into that folder.
1. Edit the library name if you want _(see details later)_.
1. Copy your project into the `library` folder.
1. Done. Your project is ready to ship.
1. You can test your library by running the `install.m` script.

### Command line way

1. Clone this repository to your system:<br />
   `git clone git@github.com:tiborsimon/MATLAB-Library-System.git my_library`<br />
   You can edit the folder name according to your needs.
1. Edit the library name if you want _(see details later)_.
1. Copy your project into the `library` folder.
1. Done. Your project is ready to ship.
1. You can test your library by running the `install.m` script.

## Folder structure

__MATLAB Library System__ has got a simple folder structure.

```
my_library                | top level folder of your library 
│   install.m             | add your library to the MATLAB path
│   librarydata.txt       | edit your library name and version here
│   LICENSE               | add your license here optionally
│   README.md             | you can edit this readme file optionally
│   uninstall.m           | remove your library from the MATLAB path
│                         | 
└───library               | all your code goes here
        dummy_lib_test.m  | dummy deletable function for installation testing
```

## Modifying the library properties

There are three library properties you can edit in the `my_library/librarydata.txt` file indexed by the rows of the file:

1. Library name
2. Library version
3. Message to the user after installation _(optional)_

Further lines will be ignored.

The default `librarydata.txt` file looks like this:

```
My Library
v1.0
HINT: Test your installation by typing: dummy_lib_test()
```

These settings will produce the following output during installation.

```
>> install
 
======================================================================================
 MATLAB Library System: installing My Library v1.0..
--------------------------------------------------------------------------------------
   path added: C:\...\library
--------------------------------------------------------------------------------------
 My Library v1.0 has been successfully installed on your system!
--------------------------------------------------------------------------------------
 HINT: Test your installation by typing: dummy_lib_test()
======================================================================================
 
```


## Possible use case

You can put your every project into a __MATLAB Library System__ so you can manage them separately by installing or uninstalling them on demand. You can ship your projects to others in a nice and isolated way too. No more hassle with the MATLAB path. Your customer just runs the install script and your project is ready to use. 

_Less friction means happier customers :)_

## License

This project is under the __MIT license__. 
See the included license file for further details.
