%% Homework 2


%% 1. Semilog Plot
x = [15 25 55 115 144 242];
y = 1:1:length(x);
figure(1), clc;
semilogx(x, y, 'ms', 'MarkerSize', 10, 'LineWidth', 4);
ylim([0 6.5]); 
xlabel('Number of Students'), ylabel('Year'); 
title('Students Per Year');


%% 2. Subplot and axis modes
s = load('mitMap.mat');
mit = squeeze(s.mit);
cmap = s.cMap;

figure(1), clc, hold on

subplot(221); % top left
imagesc(mit); colormap(cmap);
axis square, title('Square');

subplot(222); % top right
imagesc(mit); colormap(cmap);
axis tight, title('Tight');

subplot(223); % bottom left
imagesc(mit); colormap(cmap); 
axis equal, title('Equal');

subplot(224); % bottom right
imagesc(mit); colormap(cmap); 
axis xy, title('XY');


%% 3. Bar Graph
figure(1), clc;
bar(abs(randn(1,5)), 'r');
title('Bar Graph of 5 Random Values');


%% 4. Interpolation and surface plots
% see randomSurface.m


%% 5. Fun with find
function ind = findNearest(x, desiredVal)
  tmp = abs(x(:) - desiredVal);
  m = min(tmp);
  ind = find(tmp == m);
end

m = [1 5 10 15 20 25];
m(findNearest(m, 6))



%% 6. Loops and flow control
function loopTest(N)
  for i=1:N
    if mod(i,6) == 0
      disp([num2str(i) ' is divisible by 2 AND 3']);
    elseif mod(i,2) == 0
      disp([num2str(i) ' is divisible by 2']);
    elseif mod(i,3) == 0
      disp([num2str(i) ' is divisible by 3']);
    else
      disp([num2str(i) ' is NOT divisible by 2 or 3']);
    end
  end
end

loopTest(10);


%% 7. Smoothing Filter
function smoothed = rectFilt(x, width)
  if mod(width,2) == 0
    warning(['Symmetric width; increasing by one']);
    width = width + 1;
  end
  
  h = (width - 1) / 2;
  xd = [x(1) * ones(1, h) x x(end) * ones(1,h)];
  k = ones(1, width) / width;
  smoothed = conv(xd, k, 'same')(h+1 : end-h);
end

load('noisyData.mat');
smoothed = rectFilt(x, 11);
figure(1), clc;
plot(x, '.');
hold on;
plot(smoothed, 'r');


%% 8. Plot a circle
function [x,y] = getCircle(center, r)
  t = 0 : pi/80 : 2*pi;
  x = center(1) + r * cos(t);
  y = center(2) + r * sin(t);  
end

figure(1), clc;
c = jet(5);
radians = linspace(2, 10, 5);
for i = 1:5
  [x,y] = getCircle([0,0], radians(i));
  plot(x, y, 'LineWidth', 5, 'color', c(i,:));
  hold on;
end

colormat jet, axis equal;
