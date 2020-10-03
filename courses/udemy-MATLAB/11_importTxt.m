%% Import formatted data

fid = fopen('datafile.txt', 'r');  % file pointer
ignoreFirst = fgetl(fid);          % skip first line

hdr_nSensors = regexp(fgetl(fid), '\t', 'split');
nSensors = str2double(hdr_nSensors(3));

hdr_nTimepoints = regexp(fgetl(fid), '\t', 'split');
nPoints = str2double(hdr_nTimepoints(3));

% advance pointer until data start found
toggle = true;
while toggle
  l = fgetl(fid);
  if strcmpi(l(1:5), 'start')
    toggle = false;
  end
end

data = zeros(nSensors, nPoints);
toggle = true;

while toggle
  l = regexp(fgetl(fid), '\t', 'split');

  if strcmpi(l{1}(1:3), 'end')
    toggle = false;
  else
    data(str2double(l{2}), str2double(l{4})) = str2double(l{6});
  end
end

figure(1), clf
plot(data', 'linew', 2)

fclose(fid);