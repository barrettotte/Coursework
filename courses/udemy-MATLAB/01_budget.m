%% A simple example of a budget calculator

income = 2500; % semicolons suppress output

rent = 1200;
utils = 300;
car = 250;
food = 300;
phone = 50;
retirement = 0.10 * income;

outflow = rent + utils + car + food + phone + retirement;
nonEssentials = income - outflow;
perDay = nonEssentials / 30;

disp(['I can spend ' num2str(perDay) ' extra each day.'])

perWeek = nonEssentials / (30 / 7);
inThirds = perWeek / 3;

disp(['I can spend ' num2str(inThirds * 2) ' during the weekend, and ' num2str(inThirds / 5) ' each week day.'])
