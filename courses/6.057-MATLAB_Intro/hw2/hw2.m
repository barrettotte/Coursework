%% Homework 2

%% 1. Semilog Plot
x = [15 25 55 115 144 242];
y = 1:1:length(x);
figure(1);
semilogx(x, y, 'ms', 'MarkerSize', 10, 'LineWidth', 4);
ylim([0.5 6.5]); 
xlabel('Number of Students'); ylabel('Year'); 
title('Students Per Year');


%% 2. Subplot and axis modes
