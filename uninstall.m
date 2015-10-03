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

function uninstall()
    check_environment();
    [name, link, author, version, command] = get_package_data();
        
    print_header();
    print_target_data(name, link, author, version);
    
    process_paths();
    
    print_success(name, link, version);
    print_footer();
    clear name link author version command ans
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

function process_paths()
    paths = get_raw_subfolders('library', {});
    warning('off', 'all')
    for k=1:length(paths)
        rmpath(char(paths{k}));
        print_added_path(char(paths{k}));
    end
    warning('on', 'all')
    savepath;
end

function paths = get_raw_subfolders(base_dir, paths)
    d = dir(base_dir);
    for k = 1:length(d)
       if (d(k).isdir == 1)
           switch d(k).name
               case '.'
                   paths{end+1} = fullfile(pwd, base_dir);
               case '..'
                   % Nothing to do
               otherwise
                   paths = get_raw_subfolders(fullfile(base_dir, d(k).name), paths);
           end
       end
    end
end

function ret = INDENTATION()
    ret = '   ';
end

function print_header()
    disp(' ');
    disp('#====================================================================================#');
    disp('|                                                                                    |');
    disp('|                      M A T L A B   L I B R A R Y   S Y S T E M                     |');
    disp('|               >>-------------------------~-------------------------<<              |');
    disp('|                                       v1.5.0                                       |');
    disp('#------------------------------------------------------------------------------------#');
end

function print_target_data(name, link, author, version)
    disp(' ');
    disp([INDENTATION, 'Removing <a href="', link, '">', name, '</a> ', version, ' by ', author, '..'])
    disp(' ');
end

function print_added_path(path)
    disp([INDENTATION, INDENTATION, '-> Path removed: ', path]);
end

function print_success(name, link, version)
    disp(' ');
    disp([INDENTATION, 'Finished!']);
    disp(' ');
    disp([INDENTATION, INDENTATION, '<a href="', link, '">', name, '</a> ', version, ' has been succesfully removed from your system!']);
    disp(' ');
end

function print_footer()
    disp('#====================================================================================#');
    disp(' ');
end
