%% Complex Numbers

a = 2;   % real
b = -3;  % imaginary

c1 = complex(a,b);
c2 = a + i*b;       % not a good idea...iterator in loops, etc.
c3 = a + 1i*b;      % use 1i (imaginary operator)


% Eulers formula
m = 3;         % magnitude
p = 2*pi / 3;  % phase angle

e1 = m * exp(1i*p);
e2 = m * exp(cos(p) + 1i*sin(p));

e1 - e2


% Recover key parameters - magnitude and phase
m1 = sqrt(real(e1)^2 + imag(e1)^2);  % using pythagorean theorem
m2 = abs(e1);                        % using MATLAB function

p1 = atan(imag(e1) / real(e1));      % using pythagorean theorem
p2 = angle(e1);                      % using MATLAB function


% Law of Exponents
p = -4;
q = 3;

e1 = exp(p + q);
e2 = exp(p) * exp(q);

e1 - e2  % not exactly zero => computer rounding errors
