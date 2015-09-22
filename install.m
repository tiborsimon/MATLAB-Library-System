%% MATLAB Library System installation script
% By running this script the content of the current folder's `library` folder 
% will be injected into the MATLAB path permamently on your system. This will
% allow you to access any script, function, class or data from any path you
% are currently in. You can uninstall the library by running the uninstall 
% script you can find next to this script.

% The MIT License (MIT)
% 
% Copyright (c) 2015 Tibor Simon
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

function install()
    check_environment();
    [name, link, author, version, command] = get_package_data();
        
    print_header();
    print_target_data(name, link, author, version);
    
    paths = get_path_list();
    s = size(paths);
    for k=1:s(1)
        addpath(char(paths{k}));
        print_added_path(char(paths{k}));
    end

    savepath;
    
    print_success(name, link, version);
    print_demo_command(command)
    print_footer();
    clear ans k message name paths s version check
end

function check_environment()
    d = dir();
    isub = [d(:).isdir];
    nameFolds = {d(isub).name}';
    if ~ismember('library', nameFolds)
       error('library folder not found!'); 
    end
end

function [ name, link, author, version, command ] = get_package_data()
    fileID = fopen('librarydata.txt');
    name = fgetl(fileID);
    link =  fgetl(fileID);
    author = fgetl(fileID);
    version = fgetl(fileID);
    command = fgetl(fileID);
    fclose(fileID);
end

function ret = get_raw_subfolders()
    d = dir('library');
    isub = [d(:).isdir];
    ret = {d(isub).name}';
    ret(1) = []; ret(1) = [];
end

function ret = get_path_list()
    paths = get_raw_subfolders();
    s = size(paths);
    for k=1:s(1)
        ret(k) = fullfile(pwd, 'library', paths(k,:));
    end
    ret = {fullfile(pwd, 'library'); ret};
end

function print_header()
    disp(' ');
    disp('#====================================================================================#');
    disp('|                      M A T L A B   L I B R A R Y   S Y S T E M                     |');
    disp('|               >>-------------------------~-------------------------<<              |');
    disp('|                                       v1.5.0                                       |');
    disp('#====================================================================================#');
    disp('|                                   by <a href="http://tiborsimon.io">Tibor Simon</a>                                   |');
    disp('#------------------------------------------------------------------------------------#');
end

function print_target_data(name, link, author, version)
    disp(' ');
    disp(['   Installing <a href="', link, '">', name, '</a> ', version, ' by ', author, '..'])
    disp(' ');
end

function print_added_path(path)
    disp(['     -> Path added: ', path]);
end

function print_success(name, link, version)
    disp(' ');
    disp('#------------------------------------------------------------------------------------#');
    disp('|                                    S U C C E S S                                   |');
    disp('#------------------------------------------------------------------------------------#');
    disp(' ');
    disp(['   <a href="', link, '">', name, '</a> ', version, ' has been installed succesfully to your system!']);
end

function print_demo_command(command)
    disp(['   HINT: Test your installation by running: <a href="matlab:', command, '">', command, '</a>']);
    disp(' ');
end

function print_footer()
    disp('#====================================================================================#');
    disp(' ');
end
