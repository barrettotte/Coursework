%% Plotting Trig Functions and Gaussian

% Trig functions
time = 0 : 0.01 : 4*pi;  % 0-4pi, 0.01 increment
ampl = 3;
phas = pi/3;
frex = 1;

sinWave = ampl * sin(2*pi * frex*time + phas);
cosWave = ampl * cos(2*pi * frex*time + phas);
tanWave = ampl * tan(2*pi * frex*time + phas);

figure(1), clf
plot(time, sinWave, 'linew', 2)
xlabel('Time (rad.)')
ylabel('Amplitude')
set(gca, 'xtick', 0:pi/2:time(end), 'fontsize', 15)


% Gaussian
x = 0 : 0.1 : 10;
ampl = 3;
cent = 7;
widt = 0.8;

num = -(x - cent) .^ 2;
den = 2 * widt ^ 2;
gaus = ampl * exp(num ./ den);

figure(2), clf
plot(x, gaus, 'linew', 2)
xlabel('X'), ylabel('Y')