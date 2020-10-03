%% Plotting in 2D



%% Lines
figure(1), clf      % clf => clear figure
plot(randn(10,4))

hold on

plot(get(gca, 'xlim'), [0 0], 'k', 'linewidth', 3)


n = 10;
figure(2), clf

hold on

for i=1:n
  plot([i n], [0 i], 'w')
end

set(gcf, 'color', 'k')  % set figure background color
axis off



%% Bars and errorbars
n = rand(4,10);
v = 1:10;

bsxfun(@plus, m, v);  % expanded v to add to m

m = 30; % rows
n = 6;  % cols
data = randn(m, n);

figure(1), clf

subplot(131)        % 1x3 subplot
bar(1:n, mean(data, 1))
axis square, set(gca, 'xlim', [0 n+1], 'xtick', 1:n)
title('Bar plot')

subplot(132)
errorbar(1:n, mean(data), std(data), 's')
axis square, set(gca, 'xlim', [0 n+1], 'xtick', 1:n)
title('Error Bar plot')

subplot(133)
bar(1:n, mean(data, 1))
hold on
errorbar(1:n, mean(data), std(data), 's')
axis square, set(gca, 'xlim', [0 n+1], 'xtick', 1:n)
title('Bar + error plot')



%% Dots
n = 1000;
data = exp(linspace(-1,3,n));
data(2,:) = randn(1,n);

figure(1), clf

h = plot(data(1,:), data(2,:));
get(h)

set(h, 'marker', 'p')
set(h, 'LineStyle', 'none', 'MarkerSize', 10, 'MarkerFaceColor', 'red', 'MarkerEdgeColor', 'blue')



%% Scatter
n = 400;
dim1 = x .^ 2;
dim2 = sin(3 * x);
dim3 = exp(-10 * x .^ 2);

y = [dim1 ; dim2 ; dim3];

figure(1), clf
scatter(y(1,:), y(2,:), 100, y(3,:), 'filled')

xlabel('y_1'), yLabel('y_2'), legend('y_3')



%% Histogram
n = 1000;
k = 40;
r = randn(n, 1);
data = exp(r / 2);

figure(1), clf

histogram(data, k)

% another option
[y,x] = hist(data, k);
plot(x, y, 's-', 'linew', 2, 'markersize', 16, 'markerfacecolor', 'g')
xlabel('Value')
ylabel('Count')


