function p = P_DHMM(O,lambda)
%%Function to calculate P(O|lambda)
p = 0;
alphaa = forward(lambda,O,size(O)(1));
Beta = backward(lambda,O,size(O)(1));
% N = lambda{1};

T = length(O);
N = lambda{1};
B = lambda{4};
Pi = lambda{5};
for i = 1:N,
	p += Pi(i,1) * B(i,O(1)) * Beta(1,i);
end	



q = 0;
for i = 1:N,
	q += alphaa(T,i);
end	

r = 0;
if p == q,
	r = 0;
	p
	q
end;	
			
end