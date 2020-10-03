%% Export and Import Files

% exporting data
baseName = '10_testfile';
numFiles = 10;

for filei=1:numFiles
  fileName = [baseName num2str(filei) '.mat'];

  if exist(fileName, 'file')
    continue;
  end

  randomData = randn(100);
  save(fileName, 'randomData');
  disp('wrote ' fileName ' !');
end

for i=1:10
  if mod(1,2) == 0 continue, end
  disp(['Iteration ' num2str(i)])
end


% importing data
fileImports = dir('10_testfile*.mat');
allDataC = cell(1, length(fileImports));

for filei=1:length(fileImports)
  load(fileImports(filesi).name);

  if filei == 1
    allDataM = zeros(length(fileImports), size(randomData,1), size(randomData,2));
  end
  allDataC(filei) = randomData;
  allDataM(filei,:,:) = randomData;
end
