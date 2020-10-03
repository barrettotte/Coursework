%% Laplace Distribution

lambda = 3;
x = -5 : 0.01 : 5;

f = 0.5 * lambda * exp(-lambda * abs(x));
f = f ./ sum(f);  % normalize to probability density


% plot probability density function
figure(1), clf
subplot(211)
plot(x, f, 'k', 'linew', 3)
xlabel('x'), ylabel('p(f(x))')

% plot cumulative density function
subplot(212)
plot(x, cumsum(f), 'k', 'linew', 3)
xlabel('x'), ylabel('p(f(x))')
