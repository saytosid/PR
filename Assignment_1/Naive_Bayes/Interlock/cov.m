function [M] = cov(X) 

a = mean(X);
b = X .- a;
c = b';   
M = c * b;
M = M/length(X);
end;
