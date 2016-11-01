function Beta = backward(lambda , O, T) %Beta for an observation sequence

N = lambda{1};
M = lambda{2};
A = lambda{3};
B = lambda{4};
Pi = lambda{5};

Beta = zeros(T,N);
for t = T:-1:1,
	for i = 1:N,
		if t == T,
			Beta(T,i) = 1;
		end
			
		if t < T,
			% X = Beta(t+1, :);
			% X = X .* (A(i,:));
			% X = X .* (B(:, O(t+1)))';
			% a = sum(X);
			% Beta(t,i) = a;
			a = 0;
			for j = 1:N,
				a += A(i,j) * B(j,O(t+1)) * Beta(t+1,j);
			end
			Beta(t,i) = a;	
		end	
	end	
end

end