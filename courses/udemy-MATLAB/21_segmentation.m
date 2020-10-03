%% Segmentation


%% Threshold based time series segmentation
N = 5000; % points
tv = (0:N-1) / (N / 10); % time vector
ts = detrend(cumsum(randn(N,1)));

patchcolor = 'rg';
whichsign = '<>';

figure(1), clf, hold on
plot(tv, ts, 'k', 'linew', 2)
plot(get(gca, 'xlim')), [0 0], 'k')

% find threshold of 10% on both tails of distribution
tmpsort = sort(ts);
thresh(1) = tmpsort(round(0.1 * N));  % lower threshold
thresh(2) = tmpsort(round(0.9 * N));  % upper threshold

for threshi=1:2
  % find all regions exceeding thresholds
  eval(['beyondthresh = ts' whichsign(threshi) ' thresh(threshi);'])
  islands = bwconncomp(beyondthresh);

  % loop and draw patches to 0
  for i=1:islands.NumObjects
    xpnts = tv(islands.PixelIdxList{i});
    ypnts = ts(islands.PixelIdxList{i})';
    patch([xpnts xpnts(end:-1:1)], [zeros(1, length(ypnts)) ypnts(end:-1:1)], patchcolor(threshi), 'facealpha', 0.5, 'lineStyle', 'none');
  end
end
