%% More string fun, make an HTML table

% make a row vector of random chars
N = 20;
numbers = randn(N, 1);
tmpText = char(50 + randi(70, N, 1));

clc % clear screen

% build HTML string
fprintf('<html>\n<body>\n<table>\n');

for ri=1:N
  disp([  '<tr><td>' num2str(numbers(ri)) '</td><td>' tmpText(ri) '</td><td>'
end

fprintf('</table>\n</body>\n</html>')
