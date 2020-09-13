%% Homework 3 question 5 - Hodgkin-Huxley model of the neuron

x = [0.5 0.5 0.5 -60];
figure(1), clf;

for i=1:10
  [t,y] = ode45(@odehh, [0 20], x);
  
  t = linspace(0, 20, size(y, 1));
  x = y(end, :);
  x(4) = x(4) + i;
  
  if max(y(:, 4)) > 0
    plot(t, y(:, 4), 'r');
  else
    plot(t, y(:, 4), 'k');
  end
  hold on;
end

title('Threshold Behavior');
xlabel('Time (ms)'), ylabel('Transmembrane Voltage (mV)');
