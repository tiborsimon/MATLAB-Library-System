# MATLAB Library System

Library handling module that makes shipment and adding/removing MATLAB scripts and functions convenient for you and your customers.

<a title="Latest version" href="https://github.com/tiborsimon/MATLAB-Library-System/releases/latest" target="_blank">
   <img src="https://img.shields.io/badge/version-v2.2.0-green.svg?style=flat" />
</a>
<a title="Goto article" href="http://tiborsimon.io/projects/matlab-library-system/" target="_blank">
   <img src="https://img.shields.io/badge/article-read-blue.svg?style=flat" />
</a>
<a title="Goto discussion" href="http://tiborsimon.io/projects/matlab-library-system/#discussion" target="_blank">
   <img src="https://img.shields.io/badge/discussion-join-orange.svg?style=flat" />
</a>
<a title="License" href="#license">
   <img src="http://img.shields.io/badge/license-MIT-green.svg?style=flat" />
</a>

## Using the system

### Manual way

1. Download the (latest release)[http://tiborsimon.io/projects/matlab-library-system/] of the system. 
1. Edit the library name if you want _(see details later)_.
1. Copy your project into the `library` folder.
1. Done. Your project is ready to ship.
1. You can test your library by navigating into the library's main folder and by running the `install` command or the `install.m` script.

### Command line way

1. Clone this repository to your system:<br />
   `git clone git@github.com:tiborsimon/matlab-library-system.git my-library`<br />
   You can edit the folder name according to your needs.
1. Edit the library name if you want _(see details later)_.
1. Copy your project into the `library` folder.
1. Done. Your project is ready to ship.
1. You can test your library by navigating into the library's main folder and by running the `install` command or the `install.m` script.

## Folder structure

__MATLAB Library System__ has got a simple folder structure.

```
my-library                | top level folder of your library 
│   install.m             | add your library to the MATLAB path
│   librarydata.txt       | edit your library name and version here
│   LICENSE               | add your license here [optional]
│   README.md             | you can edit this readme file [optional]
│   uninstall.m           | remove your library from the MATLAB path
│                         | 
└───library               | all your code goes here, do not change the name!
        my_function.m     | dummy deletable function for installation testing
```

## Modifying the library properties

There are three library properties you can edit in the `my-library/librarydata.txt` file indexed by the rows of the file:

1. Library name
2. Library version
3. Message to the user after installation _(optional)_

Further lines will be ignored.

The default `librarydata.txt` file looks like this:

```
My Library
v1.0
HINT: Test your installation by typing: my_function()
```

These settings will produce the following output during installation.

```
>> install
 
======================================================================================
 MATLAB Library System: installing My Library v1.0..
--------------------------------------------------------------------------------------
   path added: C:\Users\Tibor\Downloads\matlab-library-system-master\my-library\library
--------------------------------------------------------------------------------------
 My Library v1.0 has been successfully installed on your system!
--------------------------------------------------------------------------------------
 HINT: Test your installation by typing: my_function()
======================================================================================
```


## Possible use case

You can put your every project into a __MATLAB Library System__ so you can manage them separately by installing or uninstalling them on demand. You can ship your projects to others in a nice and isolated way too. No more hassle with the MATLAB path. Your customer just runs the install script and your project is ready to use. 

_Less friction means happier customers :)_

## License

This project is under the __MIT license__. 
See the included license file for further details.
