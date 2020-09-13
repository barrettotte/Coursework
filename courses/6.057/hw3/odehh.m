%% Homework 3 ODE file
function dXdt = odehh(t, X)
  n = X(1);
  m = X(2);
  h = X(3);
  V = X(4);
  
  % constants
  C = 1;        % membrane capacitance
  G_K = 36;     % Potassium conductance
  G_Na = 120;   % Sodium conductance
  G_L = 0.3;    % Leak conductance
  E_K = -72;    % Potassium reversal potential
  E_Na = 55;    % Sodium reversal potential
  E_L = -49.4;  % Leak reversal potential
  
  dndt = (1 - n) * alphan(V) - n * betan(V);
  dmdt = (1 - m) * alpham(V) - m * betam(V);
  dhdt = (1 - h) * alphah(V) - h * betah(V);
  dVdt = (-1 / C) * (G_K * n^4 * (V - E_K) + ...
                    G_Na * m^3 * h * (V - E_Na) + ...
                     G_L * (V - E_L));

  dXdt = [dndt dmdt dhdt dVdt];  % result 4x1 vector
