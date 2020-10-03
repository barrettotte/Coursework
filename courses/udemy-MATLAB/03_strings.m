%% Introduction to Strings and Chars

t = 'Hello my name is Barrett';
sep = regexp(t, ' ', 'split');

% remove words with 4 chars
len = cellfun(@length, t);
keep = numchars ~= 4;
sep2 = sep(keep);

target = 'Barrett';
nameStart = strfind(t, target);
newTxt = [t(1:nameStart-1) 'First Name'];
