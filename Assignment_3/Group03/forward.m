function alphaa = forward(lambda , O, T) %alphaa for an observation sequence

N = lambda{1};
M = lambda{2};
A = lambda{3};
B = lambda{4};
Pi = lambda{5};

alphaa = zeros(T,N);
for t = 1:T,
	for j = 1:N,
		if t==1,
			alphaa(1,j) = Pi(j,1) * B(j,O(t));
		end

		if t > 1,
			a = 0;
			for i = 1:N,
				if A(i,j) == 0
					disp('ERROR')
				end
				a += alphaa(t-1,i)*A(i,j);
			end
			alphaa(t,j) = a * B(j,O(t));
		end	
	end	
end
a = 0;
for t = 1:T,
	for j = 1:N,
		if alphaa(t,j) == 0
			a +=1;
		end
	end
end
a			
end