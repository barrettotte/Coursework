%% Random Poisson-like Countdown Timer

nRep = 100;
thresh = exp(-10);               % e ^ -10
[currVal, startVal] = deal(10);  % set both to 10
decayVar = nan(nRep, 1000);

for repi=1:nRep
  counter = 0;
  currVal = startVal;

  while currVal > thresh
    counter = counter + 1;
    decayVar(repi, counter + 1) = currVal;
    currVal = currVal * rand ^ (1 / 2);
  end
end

% remove NaN elements
decayAvg = zeros(1,size(decayVar,2))
for i=1:size(decayVar,2)
  decayAvg(i) = mean(decayVar(isfinite(decayVar(:,i)), i));
end

figure(1), clf
plot(decayAvg, 'ks-', 'linew', 2, 'markersize', 15, 'markerfacecolor', 'w')
xlabel('Iterations'), ylabel('Value')
title([num2str(counter) ' iterations until threshold'])
