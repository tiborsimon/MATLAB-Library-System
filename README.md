MATLAB Library System template
==================

This system allows you to create an easily deployable MATLAB library, that installs itself to the user's MATLAB environment. 

Features of __v1.1__
* automatic library content detection
* wrong folder error detection
* safe and temporary path changing
* globally managed library name and library version

The current version frees you from any manual library template modification. Add new production functions or scripts to the __library__ folder, run the _ds_install.m_ script, and you are done. The new content is added to your MATLAB path temporarily.

[Download the latest release](https://github.com/tiborsimon/MATLAB-Library-System-template/releases) 


##Install##

By installing the library, you will put the repository's and all of it's subfolders path to the global MATLAB path. This allows you to call the functions and scripts defined in this library anywhere in MATLAB.

To install this library you should run the _ds_install.m_ script file in the root folder of the repository.

__IMPORTANT__: Before you run the script navigate your Current Folder to this repo's root, otherwise the installation will be unsuccessful..

__IMPORTANT__: Do not rename the _library_ folder name, just put your content in it.

__NOTE__: By installing the library, MATLAB has to save the path to the disk, therefore it needs permission from you to do this for the first time. It will promt a message window if you didn't give the permission yet.

To __check__ the installation, navigate out of the repository's root folder, and type `mylib_dummytest()` If the function prints out a message, you have a correctly installed library on your system.

##Uninstall##

By uninstalling the library, you simply remove the path's added before to the global MATLAB path. This will prevent MATLAB to look for the location of this repository (even if it is deleted) for a function or script name lookup.

To uninstall this library run the _ds_uninstall.m_ script.

_It is not necessary to unistall the library from your system. If you delete the repo, nothing will happen. But if you want to keep your MATLAB path clean an updated, you should run the uninstall script before you delete the repo._

##Adding new code##

Just add your new function or script to the __library__ folder, or any subfolder in it, run the _ds_install.m_ script in the root folder of the repository, and you are _done_! Nothing else needs to be modified. You can concentrate to your work without bothering with the MATLAB path.

##Change library name and version##

Find a file called __librarydata__ in the _.core_system_ hidden folder in the repo root, and edit it according to your needs.

The __librarydata__ file is a simple textfile. The first line contains the your library's name, the second line contains it's version, and there is an empty newline at the end of the file.

__IMPORTANT__: make sure you follow the syntax requirements specified above, otherwise the core library system won't display the name and version of your library correctly..

##Change prefix##

If you want to change the default _mylib_ prefix in your library to something else, you can do it. You only have to modify the _install_ and _uninstall_ script's name. Nothing else should be modified outside the __library__ folder, otherwise your core system won't work.

If you want to keep the _mylib_dummytest_ function in the _library_ folder, you should change it's prefix as well, to keep the library consistent!

__NOTE__: make sure you chose a short enough prefix. Long prefixes are headaches to type in every time.
