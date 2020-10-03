%% File/Directory Information

everything = dir;                                     % info about all files/directories
directories = {everything([everything.isdir]).name};  % get all directory names

stuff = {dir('*variab*').name};  % wildcard search
nameLens = cellfun(@length, directories);
