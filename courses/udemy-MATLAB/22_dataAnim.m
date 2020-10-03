%% Data Animations


%% Random Floating Ball
figure(1), clf
loc = [50 50];

ploth = plot(loc(1), loc(2), 'ko', 'markerSize', 30, 'markerFaceColor', 'g');
set(gca, 'xlim', [0 100], 'ylim', [0 100], 'xtick', [], 'ytick', []);
title('Press CTRL-C to quit.');

hold on
plot([10 90], [10 10], 'k:')
plot([10 90], [90 90], 'k:')
plot([10 10], [10 90], 'k:')
plot([90 90], [10 90], 'k:')

while 1
  timenow = rem(now, 1) * 50000;
  loc(1) = loc(1) + sin(timenow) + randn;
  loc(2) = loc(2) + cos(timenow) + randn;

  % bounce off walls
  loc(loc < 0) = 1;
  loc(loc > 100) = 99;


  % update XY coordinates
  set(ploth, 'XData', loc(1), 'YData', loc(2));
  pause(0.05);
end


%% Square Chases the Mouse
figure(1), clf, hold on;
loc = [50 50];

ploth = plot(loc(1), loc(2), 'ks', 'markerSize', 30, 'markerFaceColor', 'm');
targh = plot(60, 60,'rd', 'markerSize', 10, 'markerFaceColor', 'k');

set(gca, 'xlim', [0 100], 'ylim', [0 100], 'xtick', [], 'ytick', []);
title('Click on the window. Press CTRL+C to quit');

while 1
  % random walk
  mpos = round(get(gca, 'CurrentPoint'));

  % update position to get closer to mouse click point
  loc(1) = loc(1) + sign(mpos(1,1) - loc(1));
  loc(2) = loc(2) + sign(mpos(1,2) - loc(2));

  % don't go off screen
  loc(loc < 0) = 0;
  loc(loc > 100) = 100;

  set(ploth, 'XData', loc(1), 'YData', loc(2));
  set(targh, 'XData', mpos(1), 'YData', mpos(1,2));
  pause(0.05);
end
