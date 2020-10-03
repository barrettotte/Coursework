%% Some statistics stuff

data = round(exp(2 + randn(101,1) / 2));

figure(1), clf
histogram(data,20)


n = numel(data);
theMean1 = sum(data) / n;  % by hand
theMean2 = mean(data);     % MATLAB


dataSort = sort(data);
theMedian1 = dataSort(round(n / 2));  % by hand
theMedian2 = median(data);            % MATLAB


uniques = unique(data);
occurs = zeros(size(uniques));

for i=1:length(occurs)
  occurs(i) = sum(data == uniques(i));
end

[~,maxidx] = max(occurs);  % ~ discards value
theMode1 = uniques(maxidx);
theMode2 = mode(data);


theVar1 = 0;
for i=1:length(data)
  theVar1 = theVar1 + (data(i) - mean(data)) ^ 2;
end

theVar1 = theVar1 / (length(data) - 1);
theVar2 = var(data);



shiftedData = data - mean(data); % recenter on mean

theStd1 = 0;
for i=1:length(shiftedData)
  theStd1 = theStd1 + shiftedData(i) ^ 2
end

theStd1 = sqrt(theStd1 / (length(shiftedData) - 1));
theStd2 = std(data);

