function p = R(i,alphaa,beeta,t,N)
%%Function to calculate ETAt(i,j) - P(O,Qt=i,Qt+1=j|lambda)
%alphaa - matrix containing the values of forward variable, alphaa{t} - cell array at time t
%beeta - _____________________________________Backward________
%A - transition probability
%B - emmision probability
%O - Obersavation sequence for which eta is desired

numerator = alphaa(t,i)*beeta(t,i);
denom = 0;
for x = 1:N
	denom += alphaa(t,x)*beeta(t,x);

end
if(numerator==0)
	p=0;
else
	p = numerator/denom;
end
end