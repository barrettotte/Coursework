%% Homework 2 question 8 - Interpolation and surface plots

n = 5;
Z0 = rand(n);
[X0,Y0] = meshgrid(1:n);
[X1,Y1] = meshgrid(1:0.1:n);
Z1 = interp2(X0, Y0, Z0, X1, Y1, 'cubic');

figure(1), clc;
surf(X1, Y1, Z1), colormap('hsv');
colorbar, shading interp, hold on, rotate3d on;

contour(X1, Y1, Z1);
caxis([0, 1]);

hold off;
