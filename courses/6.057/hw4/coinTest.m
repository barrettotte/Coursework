%% Homework 4 question 2 - Flipping a coin
x = rand(5000, 1);
h = round(x);
t = abs(x - 1);
y = cumsum(x) ./ (cumsum(h) + cumsum(t));

plot(y, 'k'), hold on;

expected = ones(length(x), 1) * 0.5;
plot(expected, 'r');

xlabel('Number of coin flips'), ylabel('Probability of heads');
legend('Sample Probability', 'Fair Coin');
title('Sample Probability of Heads in n flips of a simulated coin');
