# MATLAB Library System

Library handling module that makes shipment and adding/removing MATLAB scripts and functions convenient for you and your customers.

<a title="Latest version" href="https://github.com/tiborsimon/MATLAB-Library-System/releases/latest" target="_blank">
   <img src="https://img.shields.io/badge/version-v2.3.0-green.svg?style=flat" />
</a>
<a title="Goto article" href="http://tiborsimon.io/projects/TSPR0001/" target="_blank">
   <img src="https://img.shields.io/badge/article-read-blue.svg?style=flat" />
</a>
<a title="Goto discussion" href="http://tiborsimon.io/projects/TSPR0001/#discussion" target="_blank">
   <img src="https://img.shields.io/badge/discussion-join-orange.svg?style=flat" />
</a>
<a title="License" href="#license">
   <img src="http://img.shields.io/badge/license-MIT-green.svg?style=flat" />
</a>

# Documentation v2.2.0

__MATLAB Library System__ is a lightweight modular packaging method addressing the inconvenient third party library handling in MATLAB[^1]. It provides a _one-command_ way to _install/uninstall_ the third party functionality into your MATLAB workspace _permanently_. It also defines a standard way for the library authors to add credit and versioning information and a quick start guide that can be used as a quick installation tester method.

## MLS packages

A library distributed with the __MATLAB Library System__ is wrapped around a top level folder. This folder wrapper is the __MLS package__. It contains the necessary _install/uninstall scripts_ and the _librarydata.txt file_. The actual library containing the third party functionality is separated this way from the package handler logic.

```
my_mls_package
│   install.m
│   uninstall.m
│   librarydata.txt    
│
└───library
    │   files1.m
    │   files2.m
    │   ...
    │ 
    ├───folder1
    ├───folder2
    └───...
```

The installer script will add the _library_ folder and all of it's subfolders into your MATLAB path permanently. The top level package folder (_my_mls_package_) won't be added, so your MATLAB workspace won't be polluted with the install and uninstall scipts. The __library__ name for the folder inside the package is __mandatory__! Do not name it another way.

## Installing an MLS package

After downloading and unzipping an MLS package the installation is straightforward.

1. Navigate into the top level MLS package folder in MATLAB
2. Run the `install` command
3. Done.

All the functions defined in the _library_ folder and it's subfolders will be available in your MATLAB workspace. You can run the `install` command by typing in to the console, or by opening up the `install.m` script and running it manually.

## Unistalling an MLS package

The method is similar to the installation steps.

1. Navigate into the top level MLS package folder in MATLAB
2. Run the `uninstall` command
3. Done.

All the functions defined in the library folder and it's subfolders will be removed from your MATLAB workspace.

## Best practice

You can have a __folder__ for your __MLS packages__ somewhere in your machine where you can keep all of your third party modules and your own packages as well. You can create a __install/uninstall all__ script that will install/uninstall all of your modules at once. In this way you can install all of your packages to your actual MATLAB workspace if you didn't do that already, or you are on a new machine. 

Check out the latest release. It will contain these scripts. Make sure you only have MLS packages inside the folder you run the scripts, otherwise it wont work.

You can write your own scripts, that has a functionality something like this:

```
d = dir('.');
for k = 1:length(d)
    if (d(k).isdir == 1)
        switch d(k).name
            case '.'
            case '..'
                % Nothing to do
            otherwise
                cd(d(k).name)
                install()
                cd('..')
        end
    end
end
```

This code scans through the current directory, and calls the _install_ command inside every folder it find in the first level.

## Printout examples

By running the `install` script, an MLS package will print out the following.

```
>> install
 
#====================================================================================#
|                                                                                    |
|                      M A T L A B   L I B R A R Y   S Y S T E M                     |
|               >>-------------------------~-------------------------<<              |
|                                       v2.3.0                                       |
#------------------------------------------------------------------------------------#
 
   Installing My Library v0.0.0 by John Smith..
 
      -> Path added: .../my_mls_package/library
 
   Finished!
 
      My Library v0.0.0 has been succesfully installed to your system!
 
      Test your installation by running: my_function()
 
#====================================================================================#
```

By running the `uninstall` script, an MLS package will print out the following.

```
>> uninstall
 
#====================================================================================#
|                                                                                    |
|                      M A T L A B   L I B R A R Y   S Y S T E M                     |
|               >>-------------------------~-------------------------<<              |
|                                       v2.3.0                                       |
#------------------------------------------------------------------------------------#
 
   Removing My Library v0.0.0 by John Smith..
 
      -> Path removed: .../my_mls_package/library
 
   Finished!
 
      My Library v0.0.0 has been succesfully removed from your system!
 
#====================================================================================#
```

## Creating your own MLS package

If you have written a library for MATLAB, and you want to ship it to others, you might want to create your own _MLS package_. This way your customers can install and manage your library with less effort.

#### 1. Download the latest MLS package template

You can download the latest __MLS package template__ added to the <a href="https://github.com/tiborsimon/matlab-library-system/releases/latest" target="_blank">latest MATLAB Library System release</a>. After unpacking the zip package, you can rename the top MLS package folder from  _my_mls_package_ to anything yout want. 

You can also download the template with git by running the following command: `git clone git@github.com:tiborsimon/matlab-library-system.git my_mls_package` where `my_mls_package` will be the name of your top level MLS package folder.

#### 2. Edit the _librarydata.txt_ file
The _librarydata.txt_ file is a simple text file containing the library related credit, verioning and demo informations line by line in a strict order. You have to follow the data orders as defined in the template:

```
My Library
http://google.com
John Smith
v0.0.0
my_function()

```

```
1st line: library name
2nd line: library url
3st line: author name
4th line: library version
5th line: demo command
```

The _library name_ will be displayed as an URL to the _library url_ as you could see in the previous section's printouts. The _demo command_ will be displayed as an URL too, but itt will call the _demo command_ on click. In this way it needs no effort by the user to try the just-installed new functionality.

#### 3. Put your own library into the _library_ folder

Make sure you put your library __into__ the _library_ folder. Do not rename the _library_ folder otherwise the install and uninstall scripts won't work properly.

#### 4. Done

You have created your MLS package that is ready to ship!


## License

This project is under the __MIT license__. 
See the included license file for further details.



[^1]: Have you ever downloaded a piece of third party MATLAB code and have you tried to use it? If you have, you probably know that it is a headache.. Managing third party libraries in MATLAB is not a trivial. The code only works if you are in the same folder, or you have to add  it manually every time you start MATLAB, because adding something to your path is not meant to be in your path unless you have saved the path.


