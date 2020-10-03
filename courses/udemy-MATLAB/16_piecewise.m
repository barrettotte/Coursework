%% Piecewise Functions

x = linspace(-10, 20, 1000);
y = zeros(size(x));

for i=1:length(x)

  if x(i) < -1
    y(i) = sin(2*pi * x(i) * 4);

  elseif x(i) > -1 && x(i) <= 0
    y(i) = 0;

  elseif x(i) > 0 && x(i) <= 3
    y(i) = x(i);

  elseif x(i) > 3 && x(i) <= 10
    y(i) = exp(x(i) / 10);
    
  else
    y(i) = 1 - (x(i) / 10);
  end
end

figure(1), clf
plot(x, y, 'r-^')


% Better solution:
xidx = dsearchn(x', [-1 0 3 10]');   % breakpoints for piecewise functions
y(1:xidx(1))         = sin(2*pi * 4*x(1:xidx(1)));
y(xidx(1)+1:xidx(2)) = 0;
y(xidx(2)+1:xidx(3)) = x(xidx(2)+1:xidx(3));
y(xidx(3)+1:xidx(4)) = exp(x(xidx(3)+1:xidx(4)) / 10);
y(xidx(4)+1:end)     = 1 - x(xidx(4)+1:end) / 10;

