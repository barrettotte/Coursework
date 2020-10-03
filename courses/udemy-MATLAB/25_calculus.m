%% Calculus


%% Plotting Symbolic Functions


% using ezplot (not recommended)
figure(1), clf;
fx = '10 * sin(x) + tan(x/2) / 10';
h = ezplot(fx);
set(h, 'linew', 2);

% using fplot
fy = @(y) 10 * sin(y) + tan(y / 2) / 10;
figure(2);
h = fplot(fy, [-15 5]);
set(h, 'linew', 2);

% plotting implicit functions
fts = @(r,t,s) 2 .^ (t .* s) + r .* s - t .* s .^ (1/3);
h = fimplicit3(fts);
rotate3d on, axis image;
set(h, 'linestyle', 'none');

% polar plot - cardioid as anon func
cardioid = @(t) 2 * (1 - cos(t));
h = ezpolar(cardioid);
set(h, 'linew', 2, 'color', 'r');


%% Function Limits
syms x
fx = (x - 4) ^ 2;

figure(1), clf;
fplot(fx, [-2 8], 'linew', 4);

% compute limit as x -> a
a = 3;
lim = limit(fx, x, a);

hold on;
plot([1 1] * a, get(gca, 'ylim'), 'r--');
plot(get(gca, 'xlim'), [1 1] * lim, 'r--');

figure(2), clf;


%% Function Derivatives

% using symbolic variables
syms x
f = sin(x);
df = diff(f);

figure(1), clf;
subplot(211);
fplot(f), hold on;
fplot(df);
legend({['f(x)=' char(f)], ['df=' char(df)]});

% evaluate func and deriv at specified point
a = pi / 3;
subs(f, a);  % do f(a)
subs(df, a); 


% now same thing, but with numeric variables
t = -5 : 0.001 : 5;
q = sin(t);
dq = diff(q) * 1000;

subplot(212);
plot(t, q), hold on;
plot(t(1 : end-1), dq);
legend({'f(q)', 'dq'});


%% Function Integration
syms x
f = x ^ 4;
intf = int(f);

figure(1), clf, hold on;
fplot(f, [-2 2]);
fplot(intf, [-2 2]);
legend({['f(x)=' char(f)], ['\int f=' char(intf)]});


% partial integration
syms x y
fxy = x^2 * y^3;
int(fxy, x); % integral with respect to x
int(fxy, y); % integral with respect to y

subs(int(fxy,x), [x y], [4 -2.3]); % evaluate at point

