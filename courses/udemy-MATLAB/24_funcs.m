%% Functions

%% Same-length Differentiation
n = 100;
t = (0 : n-1) / n;
x = randn(1,n) + linspace(0, 10, n);

% first and second derivatives
dx = diff(x);
ddx1 = diff(diff(x));
ddx2 = diff(x,2);

whos x d*

figure(1), clf;
plot(t, x, 'linew', 2);
hold on;
plot(t(1:end-1), dx, 'linew', 2);
plot(t(1:end-2), ddx, 'linew', 2);


function [dx,ddx] = diffx(x)
  % returns first and second derivative of input signal x
  
  dx = diff(x);
  dx = [dx dx(end)];

  ddx = diff(dx);
  ddx = [ddx ddx(end)];


  
%% Damped Oscillator

% anonymous function (in-line) functions
% h = @(input) function_def

fun = @(x) x .^ 2;
whos fun
fun(0)
fun(-3)

fs = 1000; % Hz
time = 0:1 / fs:2;

% define anonymous function to compute damped oscillator
damposc = @(f,d) sin(2*pi * f * time) .* exp(-d * time);
y = damposc(10, 3);

figure(2), clf;
plot(time, y, 'k', 'linew', 3);
xlabel('Time (s)'), ylabel('Amplitude');
title(func2str(damposc));
