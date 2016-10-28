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
			alphaa(1,j) = Pi(j) * B(j,O(t));
		end

		if t > 1,
			X = alphaa(t-1, :);
			X = X .* (A(:,j))';
			a = sum(X);
			alphaa(t,j) = a * B(j,O(t));
		end	
	end	
end

end