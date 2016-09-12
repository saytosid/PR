function ans = g(x,y,meani,sigma,pci)
X = [x;y];
% X
ans = (-0.5*(X-meani)')*pinv(sigma)*(X-meani) - 0.5*log(det(sigma)) + pci;

end;