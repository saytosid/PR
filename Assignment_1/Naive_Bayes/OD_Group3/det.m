function [M] = det(X)

M = X(1,1) * X(2,2) - X(1,2) * X(2,1);
end;
