function p = P_DHMM(O,lambda)
%%Function to calculate P(O|lambda)
p = 0;
alphaa = forward(lambda,O,size(O)(1));
% N = lambda{1};
T = length(O);
p = sum(alphaa(T,:));	

end