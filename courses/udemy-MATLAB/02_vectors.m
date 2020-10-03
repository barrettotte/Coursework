%%
% Introduction to Vectors and Matrices

row = [ 1 2 3 4 2 3 1 0 -999 ];  % row vector
col = [ 2 ; 4 ; 6 ; 1 ; 0 ];         % column vector

% transpose row to column vector
v = [ 1 2 3 4 5 6 23 ]';
v = transpose( [ 1 2 3 4 5 6 ]);

m = [ 1 0 3 ; 2 4 1 ];   % 2x3 matrix
m = [ 1 0 ; 3 1 ; 9 9]'; % transpose a 3x2 matrix

m = ones(4);   % 4x4 matrix of ones
v = ones(4,1); % column vector of ones
v = ones(1,4); % row vector of ones

v = ones(8,1) * 0.25;
v = zeros(8,1) + 0.25;

m = randn(4,3);
