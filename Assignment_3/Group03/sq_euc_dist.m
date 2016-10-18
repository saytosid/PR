function [dist] = sq_euc_dist(x,y)

y = (y .- x);
y = y .^2;
dist = sum(sum(y));					% check here

end;	