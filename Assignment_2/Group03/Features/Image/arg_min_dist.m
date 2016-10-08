function [a] = arg_min_dist(X,M)				% X is 36x23
												% Mean is kx36x23
M = (M .- X);
M = M .^2;
x = rows(X);
[i,j,m] = size(M);

for i=1:m,
	dist(i,:) = sum(M(:,:,i));
end;

dist1 = zeros(m,1);

for i=1:m,
	dist1(i,:) = sum(dist(i,:));
end;

[c,a] = min(dist1);
end;