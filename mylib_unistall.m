%% MATLAB Library System uninstallation script
% By running this script the content of the current folder's `library` folder 
% will be removed from the MATLAB path permamently on your system.

% IMPORTANT: before you run the script navigate your Current Folder to the
% DSP Sandbox repo root, otherwise the installation will be unsuccessful..

% Tibor Simon 2015 All rights reserved under the MIT License


try
    if core_checkenvironment(dir);
        [name, version] = core_getlibrarydata();
        
        rootDirectory = strcat(pwd,'\');
        % rmpath(pwd);
        rmpath(strcat(rootDirectory,'.core_system'));

        allLibraryDirectories = regexp(genpath('library'),['[^;]*'],'match');

        for k=1:length(allLibraryDirectories)
            newPath = strcat(rootDirectory,allLibraryDirectories{k});
            rmpath(newPath);
        end

        savepath;

        disp(' ');
        disp([name, ' ', version, ' has been successfully removed from your system!']);
        disp(' ');
        clear name version newPath rootDirectory allLibraryDirectories
    else
        error('Error: You are in the wrong folder! Make sure you navigate to the root folder of your library that contains the uninstall script!');
    end
catch err
    clear err;
    error('Error: Your library has been uninstalled already..')
end 

clear ans currentFolders result k

% Created by Tibor Simon at 2014.10.02. Budapest
