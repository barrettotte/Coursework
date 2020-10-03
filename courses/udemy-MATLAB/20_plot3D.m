%% 3D plotting



% Sphere in a cube
rotate3d on
figure(1), clf, hold on

% draw bottom of cube
plot3([0 0], [0 1], [0 0], 'k', 'linew', 2)
plot3([0 1], [0 0], [0 0], 'k', 'linew', 2)
plot3([0 1], [1 1], [0 0], 'k', 'linew', 2)
plot3([1 1], [0 1], [0 0], 'k', 'linew', 2)

% draw top of cube
plot3([0 0], [0 1], [1 1], 'r', 'linew', 2)
plot3([0 1], [0 0], [1 1], 'r', 'linew', 2)
plot3([0 1], [1 1], [1 1], 'r', 'linew', 2)
plot3([1 1], [0 1], [1 1], 'r', 'linew', 2)

% draw sides of cube
plot3([0 0], [0 0], [0 1], 'b', 'linew', 2)
plot3([0 0], [1 1], [0 1], 'b', 'linew', 2)
plot3([0 0], [1 1], [0 1], 'b', 'linew', 2)
plot3([1 1], [0 0], [0 1], 'b', 'linew', 2)

axis square
xlabel('x'), ylabel('y'), zlabel('z')

% sphere inside box
[sx, sy, sz] = sphere;
plot3(sx/2 + 0.5, sy/2 + 0.5, sz/2 + 0.5, 'ko', 'markerFaceColor', 'm')



%% Colorful Cube
figure(1), clf

n = 10;
ni = linspace(0, 1, n);
[X,Y] = meshgrid(ni);
x = [X(:) X(:)]';
y = [Y(:) Y(:)]';
z = [zeros(1, n*n); ones(1, n*n)];

plot3(x, y, z, 'k', y, z, k, 'k', z, x, y, 'k')

hold on
[X,Y,Z] = meshgrid(ni);
color = randn(1, n ^ 3);
h = scatter3(X(:), Y(:), Z(:), 200, color, 'filled');
set(h, 'Marker', 's')

axis square, axis off, rotate3d on



%% Expanding Wavelets
n = 50;
frex = linspace(1, 8, n);
time = -2:0.001:2;

wave = zeros(n, length(time));
for fi=1:n
  s = 5 / (2 * pi * frex(fi));
  wave(fi,:) = cos(2 * pi * frex(fi) * time) .* exp(-time^2 / (2 * s ^ 2));
end

figure(2), clf

surf(wave, time, frex)
shading interp
rotate3d on, axis square
xlabel('Time (s)'), ylabel('Frequency (Hz)', zlabel('Amplitude'))



%% Textured Gaussian Surface
n = 100; % resolution
s = 2;   % width

x = linspace(-5, 5, n);
[X,Y] = meshgrid(x);

gaus2d = exp(-(x .^ 2 + Y .^ 2) / (2 * s^2));

figure(1), clf

surf(x, x, gaus2d)
shading interp
axis square
rotate3d on

figure(2), clf
color = randn(n);
surf(x, x, gaus2d, color);
axis square, rotate3d on



%% A Ball in 3D Color Space
skip = 4;  % downscaling (256 => 64)
cent = round([0.3 0.0 0.8] * 255 / skip);
radius = round(0.3 * 255 / skip);

% define indeices in RGB color space
x = 0:255/skip;
[R, G, B] = meshgrid(x - cent(2), x - cent(1), x - cent(3));

distSph = sqrt(R .^ 2 + G .^ 2 + B .^ 2)  % Euclidean distance
distSph = distSph < radius;

% convert subscripts into indices
[i, j, k] = ind2sub(size(distSph), find(distSph(:)));

figure(1), clf
scatter3(i, j, k, 30, [i j k] ./ (255 / skip), 'filled')
axis square, rotate3d on
set(gca, 'xlim', [0 255] / skip, 'ylim', [0 255] / skip, 'zlim', [0 255] / skip)
xlabel('Red'), ylabel('Green'), zlabel('Blue')



%% Plane in R3 spanned by two vectors
v = [1 1 0];
w = [1 2 1];

figure(1), clf, hold on
plot3([0 v(1)], [0 v(2)], [0 v(3)], 'r', 'linew', 2)
plot3([0 w(1)], [0 w(2)], [0 w(3)], 'r', 'linew', 2)

axis square, rotate3d on

% plot subspace spanned by two vectors. '@' inline (anonymous) functions ?
h = ezmesh(@(s,t)v(1)*s+w*t, @(s,t)v(2)*s+w(2)*t, @(s,t)v(3)*s+w(3)*t, [-1 1 -1 1 -1 1]);
set(h, 'faceColor', 'g', 'cdata', ones(50))
title('')

% any vector defined as a linear combination of v and w
u = randn * v + randn * w;
uh = plot3([0 u(1)], [0 u(2)], [0 u(3)], 'b', 'linew', 2);

% update vector u with another value (can do multiple times)
u = randn * v + randn * w;
set(uh, 'XData', [0 u(1)], 'YData', [0 u(2)], 'ZData', [0 u(3)])



%% Complex Sinc Surface
x = linspace(-8, 8, 50);
y = linspace(-8, 8, 49); % asymmetric on purpose
sincsurf = zeros(length(x), length(y));

% implemented with loop
for i=1:length(x)
  for j=1:length(y)
    z = complex(x(i), y(j)); % complex number from x(real) and y(imag)
    sincsurf(i,j) = sin(z) / z;
  end
end

% without a loop
z = bsxfun(@plus, x + 1i * y')';
sincsurf = sin(z) ./ z;

f2plot = real(sincsurf) - abs(sincsurf);

figure(1), clf
surf(y, x, f2plot)
shading interp, rotate3d on
xlabel('Real'), ylabel('Imag'), zlabel('f(z)')
axis square
