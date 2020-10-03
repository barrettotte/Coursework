%% Importing an Excel document

dataFolder = '/home/barrett/Programming/Repos/Learn/MATLAB/';
dataFile = '10_sensordata.xlsx';

[numData, txtData, rawData] = xlsread([dataFolder dataFile]);
whos

startLine = find(strcmpi(rawData(:,1), 'start data'));
sensorId = cell2mat(rawData(startLine+1:end-1, 2));
timePoints = cell2mat(rawData(startLine+1:end-1, 4));
dataTemp = cell2mat(rawData(startLine+1:end-1, end));

uchans = unique(sensorId);
utimes = unique(timePoints);
dataMat = nan(length(uchans), length(utimes));

for i=1:length(sensorId)
  dataMat(sensorId(i), timePoints(i)) = dataTemp(i);
end

figure(1), clf
plot(dataMat', 's-', 'markerfacecolor', 'w');


% find missing points
missingData = find(isnan(dataMat));
for i=1:length(missingData)
  % convert index to subscript to find channel/time point
  [mChan, mTime] = ind2sub(size(dataMat), missingData(i));
  warning(['Channel ' num2str(mChan) ' timepoint ' num2str(mTime) ' has a missing value']);
end
