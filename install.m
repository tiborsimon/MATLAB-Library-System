%% MATLAB Library System installation script
% By running this script the content of the current folder's `library` folder 
% will be injected to the MATLAB path permamently on your system. This will
% allow you to access any script, function, class or data from any path you
% are currently in. You can uninstall the library by running the uninstall 
% script you can find next to this script.

% Tibor Simon 2015 All rights reserved under the MIT License


%% Test the current location

rootDirectory = strcat(pwd,'\');

try
    addpath(strcat(rootDirectory,'.core_system'));
    check = core_checkenvironment(dir); 
catch err 
    check = 0;
    rmpath(strcat(rootDirectory,'.core_system'));
end

%% Based on the previous test, add the libraries or send an error message

if check
    allLibraryDirectories = regexp(genpath('library'),['[^;]*'],'match');
    
    for k=1:length(allLibraryDirectories)
        newPath = strcat(rootDirectory,allLibraryDirectories{k});
        addpath(newPath);
    end

    savepath;

    [name, version] = core_getlibrarydata();

    disp(' ');
    disp([name, ' ', version, ' has been successfully installed on your system!']);
    disp(' ');
    clear name version newPath rootDirectory allLibraryDirectories
else
    clear check err rootDirectory
    error('Error: You are in the wrong folder! Make sure you navigate to the root folder of your library that contains the install script!');
end

clear ans currentFolders result k check

% Created by Tibor Simon at 2014.10.02. Budapest
