function p = ETA(i,j,alphaa,beeta,A,B,O,t)
%%Function to calculate ETAt(i,j) - P(O,Qt=i,Qt+1=j|lambda)
%alphaa - cell array containing the values of forward variable, alphaa{t} - cell array at time t
%beeta - _____________________________________Backward________
%A - transition probability
%B - emmision probability
%O - Obersavation sequence for which eta is desired

numerator = alphaa{t}{i}*A(i,j)*B(j,O(t+1))*beeta{t+1}{j};
denom = 0;

end