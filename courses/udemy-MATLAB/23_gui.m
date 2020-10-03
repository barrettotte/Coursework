%% GUI


%% Dialog Box
questions = { 'Enter matrix size as <rows>X<columns> or <rows>,<columns>'; ...
              'Title of the figure'; 'Output filename' };
answers = inputdlg(questions, 'This is a title');

xloc = [strfind(lower(answers{1}), 'x') strfind(answers{1}, ',')];
matsize = [sscanf(answers{1}(1 : xloc-1), '%g') sscanf(answers{1}(xloc+1 : end), '%g')];

figure(1), clf;
imagesc(randn(matsize));
title(answers{2});

print(gcf, [answers{3} '.png'], '-dpng');


%% Interface to Select Files and Folders
[filename, pathname] = uigetfile('*.m', 'Select the file that you are looking for');
pathname = uigetdir(pwd, 'Pick a folder to write to');
pathname = [pathname '\'];
save([pathname 'testfile.txt'], 'pathnames');


%% Input and Message Boxes
txt = questdlg('Yes or No?');
num = inputdlg('Specify a number.');
h = msgbox([num{1} ' is a number']);
set(h, 'Color', [1 0 1], 'Position', [100 200 900 300]);
