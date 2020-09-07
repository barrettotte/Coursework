% Homework 1 - Plotting

x = linspace(0, 2*pi)

sinWave = sin(x);
cosWave = cos(x);

figure(1), clf
plot(x, sinWave)

hold on

plot(x, cosWave, 'r--')

legend('Sin', 'Cos')
xlabel('Time (s)')
ylabel('Function value')
xlim([0 2*pi]) 
ylim([-1.4 1.4])
axis square, title('Sin and Cos Functions')