%% Homework 4

%% 1. Random variables.
x = 2 + 5 .* randn(500, 1);
mean(x)
std(x)


%% 2. Flipping a coin.
% See coinTest.m


%% 3. Histogram.
R = poissrnd(5, [1,1000]);
[N,X] = hist(R);
bar(X, N ./ sum(N)), hold on;

ppdf = poisspdf(0:1200, 5);
xlim([-2,15]);

plot(ppdf, 'r');
xlabel('Value'), ylabel('Probability');
title('Poisson distribution and observed histogram');
legend('Experimental histogram', 'Actual Poisson Distribution');


%% 4. Practice with cells.
s = {'Joe', 'Smith', 30000' ; ...
     'Sarah', 'Brown', 150000 ; ...
     'Pat', 'Jackson', 120000 }
disp(s);

s{2,2} = 'Meyers';
disp(s);

s{3,3} = s{3,3} + 50000;
disp(s);


%% 5. Using Structs.
a = dir;
[s,~] = size(a);
i = 1;
while i <= s
  if ~a(i).isdir
    disp(['File ', a(i).name, ' contains ' num2str(a(i).bytes), ' byte(s)'])
  end
  i = i + 1;
end
