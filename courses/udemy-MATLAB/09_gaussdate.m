%% Display Day of January 1st

A = 2002;
dayJan1 = mod(1 + 5*mod(A-1,4) + 4*mod(A-1,100) + 6*mod(A-1,400), 7);

switch dayJan1
  case 0
    day = 'Sunday';
  case 1, day = 'Monday';
  case 2, day = 'Tuesday';
  case 3, day = 'Wednesday';
  case 4, day = 'Thursday';
  case 5, day = 'Friday';
  case 6, day = 'Saturday';
end

currYear = clock(1);

if A > currYear
  fprintf('Jan 1 %g will be a %s\n', A, day);
else
  fprintf('Jan 1 %g was a %s\n', A, day);
end
