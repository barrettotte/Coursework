# 6.057 Introduction to MATLAB

https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-057-introduction-to-matlab-january-iap-2019/index.htm


## Course Outline
1. Introduction to MATLAB
   - [x] Lecture 1
   - [x] Homework 1
2. Visualization and Programming
   - [x] Lecture 2
   - [x] Homework 2
3. Solving Equations, Curve Fitting, and Numerical Techniques
   - [x] Lecture 3
   - [x] Homework 3
4. Advanced Methods
   - [x] Lecture 4
   - [ ] Homework 4
5. Various Functions and Toolboxes
   - [ ] Lecture 5


- GNU Octave - ```sudo apt-get install octave``` (https://www.gnu.org/software/octave/)
- Octave no GUI - ```octave --no-gui```


---
## Lecture 01 - Introduction to MATLAB
- edit file ```edit myfile.m```
- "Weakly typed" language
- Two types of arrays
  - Matrix of numbers - double or complex
  - Cell array of objects - more advanced data structure
- Indexing starts at one, not zero
- Matrix indexing
  - subscripts (row and column) => m(1,2)
  - linear indices (matrix as a vector) => m(3)

```MATLAB
% Some Syntax Notes

%% I am a code block! Like how Jupyter works

% Variables
myNum = 3.14
myStr = 'Hello World'
myVar = 45;  % suppress output with semicolon

disp(['Hello world'])

% Row Vectors (comma or space separated)
row = [1 2 3 4 5 6.7 8.9 0];
row = [1,2,3,4,5,6,7,8,9,0];

% Column Vectors (semicolon separated)
col = [1; 2; 3; 4; 5; 6; 7; 8; 9; 0]

% Size and Length
size(row)    % 4  1
size(col)    % 1  4
length(row)  % 4
length(col)  % 4

% Matrices
a = [1 2; 3 4];  % [ 1 2 ] 
                 % [ 3 4 ]

% Basic Scalar Operations
7 / 45
(1 + 1i) * (1 + 2i)
1 / 0
0 / 0

4 ^ 2
(3 + 4 * 1j) ^ 2
((2 + 3) * 3) ^ 0.1

% Built-in Functions
sqrt(2)
log(2), log10(0.23)
cos(1.2), atan(-0.8)
exp(2 + 4*1i)
round(1.4), floor(3.3), ceil(4.23)
angle(1i); abs(1+1i);

% Transpose (col => row, row => col)
a = [1 2 3 4+i]
transpose(a)
a'   % hermitian-transpose
a.'  % when tranposing a vector, use this to be safe

% Element-wise Functions
% Use dot:  .*,./,.^
a = [1 2 3]; b = [4;2;1];
a.*b, a./b, a.^b          % all errors
a.*b.', a./b.', a.^(b.')  % all valid

% Automatic Initialization
o = ones(1, 10)         % row vector with 10 elements, all 1
z = zeros(23, 1)        % col vector with 23 elements, all 0
r = rand(1, 45)         % row vector with 45 elements, uniform rand (0,1)
n = nan(1, 69)          % row vector of NaNs (uninitialized variables)

a = linspace(0, 10, 5)  % start 0, end 10 (inclusive), 5 values
b = 0:2:10              % start at 0, step 2, end at or before 10
c = 1:5                 % step=1 if not specified


% Plotting
x = linspace(0, 4*pi, 10);
y = sin(x);
plot(y);     % plot values against their index
plot(x,y);   % plot y versus x

% plot generates dots at each (x,y) pair and connects the dots with a line

```

---
## Lecture 02 - Visualization and Programming

```MATLAB

% Plotting Introduction
x = linspace(0, 4*pi, 10);
y = sin(x);
plot(y);
plot(x,y);

% User-defined functions
% function [out1, outN] = funcName(in1, inN)

function [avg,sd,range] = stats(x)
avg = mean(x);
sd = std(x);
range = [min(x) ; max(x)];

% relational operators
%  ~= not equal (only one that's weird)
%  == > < <= >=

% logical operators
%  &  &&   OR   % elementwise ; short circuit
%  |  ||   AND
%  ~       NOT
%  xor     XOR
%  all     ALL TRUE
%  any     ANY TRUE

% Boolean: zero is false, nonzero is true

% conditionals  (also has switch)
if x == 1
  % ...
elseif x == 2
  % ...
else
  % ...
end

% for loop
for n=1:100
  % ...
end

% while
while x == 1
  % ... can use break
end

% plot options
plot(x, y, 'k.-');  %  'k.-' => color, marker, line-style

plot(x, y, 's--', 'LineWidth', 2, ...
      'Color', [1 0 0], ...
      'MarkerEdgeColor', 'k', ...
      'MarkerFaceColor', 'g', ...
      'MarkerSize', 10)

% 3D line plots
time = 0:0.001:4*pi;
x = sin(time);
y = cos(time);
z = time;
plot3(x, y, z, 'k', 'LineWidth', 2);
zlabel('Time');
% xlim, ylim, and zlim can also be set!

% axis modes
axis square  % current axis square box
axis tight   % fits axes to data
axis equal   % makes x and y scale the same
axis xy      % put origin in lower left corner (default for plots)
axis ij      % origin in upper left corner (default for matrices/images)

% multiple plots
subplot(2,3,1)   % figure with 2 rows, 3 cols of axes, and activates first axis for plotting
subplot(2,3,4:6) % activate range of axes and fuses them into one
close([1 3])     % close figures 1 and 3
close all        % close all figures

% visualizing matrices
mat = reshape(1:10000, 100, 100);
imagesc(mat);  % auto scale vals to span entire colormap
colorbar
caxis([3000 7000])  % set limits for color axis (like xlim,ylim)

% colormaps
imagesc(mat)  % default is parula
colormap(grey)
colormap(cool)
colormap(hot(256))  % 'help hot' for list

% custom colormap
map = zeros(256, 3);
map(:,2) = (0:255) / 255;
colormap(map);

% surface plots
%
% surf puts vertices at specified points in space x,y,z and
%   connects all the vertices to make a surface.
x = -pi : 0.1 : pi;     % make x vector
y = -pi : 0.1 : pi;     % make y vector
[X,Y] = meshgrid(x,y);  % make matrices
Z = sin(X) .* cos(Y);   % eval matrices
surf(X, Y, Z);
surf(x, y, z);

% surf options
shading faceted
shading flat
shading interp
colormap(gray)  % colormap of surface plot can also be changed

% contour
% make 2D surfaces
contour(X, Y, Z, 'LineWidth',2)
hold on
mesh(X, Y, Z)

% specialized plotting functions
polar(0:0.01:2*pi, cos((0:0.01:2*pi) * 2));  % make polar plots
bar(1:10, rand(1,10));                       % bar graph

[X,Y] = meshgrid(1:10, 1:10);
quiver(X, Y, rand(10), rand(10));            % plot velocity vectors

stairs(1:10, rand(1,10));                    % piecewise constant functions

fill([0 1 0.5], [0 0 1], 'r');               % draw/fill polyon with vertices

% find - returns indices of nonzero values (used to avoid loops)
x = rand(1, 100);
inds = find(x > 0.4 & x < 0.6);

% vectorization (avoiding loops!)
% vectorized code is more efficient for MATLAB
```


---
## Lecture 03 - Solving Equations, Curve Fitting, and Numerical Techniques

```matlab
% Systems of Linear Equations
% Given    x + 2y - 3z = 5
%        -3x -  y +  z = -8
%          x -  y +  z = 0
A = [1 2 -3 ; -3 -1 1 ; 1 -1 1];
b = [5 ; -8 ; 0];
x = A \ b; % solve: 3x1 vector containing solution
           % '\' is for solving

% another
A = [1 4 ; -3 1];
b = [34 ; 2];
rank(A)
x = inv(A) * b;
x = A \ b;

% more linear algebra
mat = [1 2 -3 ; -3 -1 1 ; 1 -1 1];
r = rank(mat);
d = det(mat);
E = inv(mat);
c = cond(mat);

% matrix decompositions
[V,D] = eig(X);   % eigenvalue decomposition
[U,S,V] = svd(X); % singular value decomposition
[Q,R] = qr(X);    % QR decomposition
[L,U] = lu(X);    % LU decomposition
R = chol(X);      % Cholesky decomposition


% Polynomials
% MATLAB represents polynomials by vector of coefficients
P = [1 0 -2];   % polynomial x^2 - 2
P = [2 0 0 0];  % polynomial 2x^3

% Polynomial Operations
r = roots(P);         % roots of polynomial; r vector length N
P = poly(r);          % get polynomial from roots
y0 = polyval(P, x0);  % evaluate at point
y = polyval(P, x);    % evaluate at many points

% Polynomial Fitting
X = [-1 0 2];
Y = [0 -1 3];
p2 = polyfit(X, Y, 2); % fit points (-1,0), (0,-1), (2,3)
plot(X, Y, 'o', 'MarkerSize', 10);
hold on;
x = -3 : 0.01: 3;
plot(x, polyval(p2, x), 'r--');


% Nonlinear Root Finding
function y = myfun(x)
  y = cos(exp(x)) + x .^ 2 - 1;
% endfunc

x = fzero('myfun', 1);  % fzero calcs roots for any arbitrary func
x = fzero(@myfun, 1);

% Minimizing a function
x = fminbnd('myfun', -1, 2);  % minimize func over bounded interval
x = fminsearch('myfun', 0.5); % unconstrained interval


% Anonymous functions
x = fzero(@(x) (cos(exp(x)) + x .^ 2 - 1), 1);
x = fminbnd(@(x) (cos(exp(x)) + x .^ 2 - 1), -1, 2);
func = @(x) (cos(exp(x)) + x .^ 2 - 1);
func(1:10);


% Numerical Differentiation
x = 0:0.01:2*pi;
y = sin(x);
dydx = diff(y) ./ diff(x); % differentiate numerically

mat = [1 3 5 ; 4 8 6];
dm = diff(mat, 1, 2);  % can also work on matrices

[dx,dy] = gradient(mat); % gradients, neat


% Numercial Integration
% Simpson's quadrature (input as func)
q = quad('myfun', 0, 10); % integral of func from 0-10
q2 = quad(@(x) sin(x) .* x, 0, pi);

% Trapezoidal rule (input as vector)
x = 0:0.01:pi;
z = trapz(x, sin(x));
z2 = trapz(x, sqrt(exp(x)) ./ x);
```


---
## Lecture 04 - Advanced Methods
```MATLAB
% rand   => uniform distribution from 0 to 1
% randn  => standard normal distribution (gaussian)
% random => randoms using many other distributions

% cell array => array, but elements don't have to be the same type
a = cell(3,10);                             % cell: 3 rows, 10 cols
c = {'hello world', [1 2 3 4], rand(3,2)};  % cell manually created
a{1,1} = [1 3 4 -10];                       % access


% structs => like C style structs
s = struct;  % create new struct (at 1x1)
s.name = 'Barrett';
s.age = 24;

people = struct('name', {'Barrett', 'WASD'}, 'age', {24,99});  % struct[] 1x2
person = people(2);
name = people(1).name;

% handles
L = plot(1:10, rand(1,10));  % handle for plotted line
A = gca;                     % handle for current axis
F = gcf;                     % handle for current figure

get(L);                      % access property of handle
yVals = get(L, 'YData');     

set(A, 'FontName', 'Arial', 'XScale', 'log'); % set property
set(L, 'LineWidth', 1.5, 'Marker', '*');         

% image IO
im = imread('mypic.jpg');  % import image as matrix of pixel values
imshow(im);

imwrite(rand(300,300,3), 'tmp.jpg');                % rgb matrix (0-1 or 0-255)
imwrite(ceil(rand(200)*256), jet(256), 'tmp.jpg');

% file IO
a = importdata('mytext.txt');  % struct => data,textdata,colheaders fields
x = a.data;
names = a.colheaders;
a = importdata('myfile', ','); % import using ',' delimiter

% Excel files
xlswrite('randomNumbers', rand(10));
xlswrite('randomNumbers', rand(10), 'Sheet1', 'C11:L20');
[num,txt,raw] = xlsread('randomNumbers.xls');

% read any file
fid = fopen('myfile', 'r');  % file handle
data = fread(fid, 10);       % read next 10 bytes
fseek(fid, 5, 0);            % move forward 5 bytes

```


---
## Lecture 05 - Various Functions and Toolboxes
```MATLAB
% random things
[x,y,z] = deal(zeros(20,30));   % set x,y,z to same value

a1 = 1; n = 1;
eval(['a' num2str(n) ' = 5;']); % evaluate string as code
disp(['a1 = ' num2str(a1)]);

% skipped Simulink stuff, I'm using Octave

% symbolic variables
a = sym('1/3');
b = sym('4/5');
mat = sym([1 2 ; 3 4]);
syms x y real;          % shorthand

% This lecture was optional; so I'm good to end here.
```