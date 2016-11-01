function p = ZETA(i,j,alphaa,beeta,A,B,O,t,N)
%%Function to calculate ETAt(i,j) - P(O,Qt=i,Qt+1=j|lambda)
%alphaa - matrix containing the values of forward variable, alphaa{t} - cell array at time t
%beeta - _____________________________________Backward________
%A - transition probability
%B - emmision probability
%O - Obersavation sequence for which eta is desired
% size(alphaa)
% size(O)
numerator = alphaa(t,i)*A(i,j)*B(j,O(t+1))*beeta(t+1,j);
denom = 0;
for x = 1:N
	for y = 1:N
		denom += alphaa(t,x)*A(x,y)*B(y,O(t+1))*beeta(t+1,y);
	end
end
if(numerator==0),
	p=0;
end
if(numerator!=0)
	p = numerator/denom;
end
end