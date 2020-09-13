%% Homework 4 question 5

function displayDir
  x = dir;
  [s,~] = size(x)
  i = 1;
  
  while i <= s
    if ~a(i).isdir
      disp(['File ', a(i).name, ' contains ', num2str(a(i).bytes), ' bytes']);
    end
    i = i + 1;
  end
end
