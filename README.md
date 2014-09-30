MATLAB Library Template
==================

This is the library template used for the MATLAB DSP sandbox library. This system allows you to create an easily deployable MATLAB library, that installs itself to the user's MATLAB environment. 

Features of __v1.1__
* automatic library content detection
* wrong folder error detection
* safe and temporary path changing
* globally managed library name and library version

The current version frees you from any manual library template modification. Add new production functions or scripts, run the _ds_install.m_ script, and you are done. The new content is added to your MATLAB path temporarily automatically.


##Install##

By installing the library, you will put the repository's and all of it's subfolders path to the global MATLAB path. This allows you to call the functions and scripts defined in this library anywhere in MATLAB.

To install this library you should run the _ds_install.m_ script file in the root folder of the repository.

__IMPORTANT__: before you run the script navigate your Current Folder to this repo's root, otherwise the installation will be unsuccessful..

##Adding new code##

Just add your new function or script to the __library__ folder, or any subfolder in it, run the _ds_install.m_ script in the root folder of the repository, and you are _done_! Nothing else needs to be modified. You can concentrate to your work without bothering with the MATLAB path.

##Uninstall##

By uninstalling the library, you simply remove the path's added before to the global MATLAB path. This will prevent MATLAB to look for the location of this repository (even if it is deleted) for a function or script name lookup.

To uninstall this library run the _ds_uninstall.m_ script.

_It is not necessary to unistall the library from your system. If you delete the repo, nothing will happen. But if you want to keep your MATLAB path clean an updated, you should run the uninstall script before you delete the repo._
