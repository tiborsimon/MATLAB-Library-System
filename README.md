MATLAB Library Template
==================

This is the library template used for the MATLAB DSP sandbox library. This system allows you to create an easily deployable MATLAB library, that installs itself to the user's MATLAB environment. The current version allows you to manage the librarys name and version globally.


##Install##

By installing the library, you will put the repository's and it's subfolders path to the global MATLAB path. This allows you to call the functions and scripts defined in this library anywhere in MATLAB.

To install this library you should run the _ds_install.m_ script.

__IMPORTANT__: before you run the script navigate your Current Folder to this repo's root, otherwise the installation will be unsuccessful..

##Uninstall##

By uninstalling the library, you simply remove the path's added before to the global MATLAB path. This will prevent MATLAB to look for the location of this repository (even if it is deleted) for a function or script name lookup.

To uninstall this library run the _ds_uninstall.m_ script.

It is not necessary to unistall the DSP sandbox from your system. If you delete the repo, nothing will happen. But if you want to keep your Matlab path clean an updated, you should run the uninstall script before you delete the repo.

##Where to modify##

You can put your own production scripts and functions in the __library__ folder and in arbitrary subfolders in it. In the current version you have modify the install and uninstall scripts when you added a production scripts to anywhere in the __library__ folder. You have to add _addpath(...)_ and _rmpath(...)_ commands to the scripts in the appropriate place in the corresponding files. In a future version the install and uninstall scriptst will do this work for you.

To modify the library name, open up the __librarydata__ file in the hidden __.core_system__ folder, and rewrite the name or the version number implicitly.
