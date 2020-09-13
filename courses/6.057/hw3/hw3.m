%% Homework 3


%% 1. Linear system of equations
A = [3 6 4 ; 1 5 0 ; 0 7 7];
b = [1 ; 2 ; 3];
x1 = A \ b;


%% 2. Numerical integration

% integral f(x) from 0 to 5
f = @(x) x .* exp(-x / 3);
q1 = quad(f, 0, 5)

x = 0 : 0.01 : 5;
q2 = trapz(x, x .* exp(-x / 3))
-24 * exp(-5 / 3) + 9


%% 3. Computing the inverse
m = [1 2 ; 3 4];
invm = inv(m);
m * invm


%% 4. Fitting polynomials
clc;
load('randomData.mat');
plot(x, y, 'k.', 'MarkerSize', 20);
hold on;

x0 = 100 : 0.1 : 200;
colors = ['rgybm'];

for i=1:5
  [f,s,m] = polyfit(x, y, i);
  plot(x0, polyval(f, x0, s, m), colors(i));
end

legend('Data', '1st order', '2nd order', '3rd order', '4th order', '5th order');
title('Polynomial fit to Noisy Data');
xlabel('X'), ylabel('Y');


%% 5. Hodgkin-Huxley model of the neuron
% see ODE.m and HH.m
