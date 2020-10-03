%% Sigmoid Function

a = 1.4;  % amplitude (max value)
b = 2;    % steepness ("heat" parm)
c = -1;   % x-axis shift

x = linspace(-5, 5, 400);
sigmoid = a ./ (1 + exp(-b * (x - c)));

figure(5), clf
plot(x,sigmoid, 'linew', 3)
hold on
plot([0 0], get(gca, 'ylim'), 'k--')

% vertical line at x=c
plot([c c], get(gca, 'ylim'), 'r--')

% horizontal line at y=a/2
plot(get(gca, 'xlim'), [1 1] * a/2, 'm--')

xlabel('x'), ylabel('f(x)')
