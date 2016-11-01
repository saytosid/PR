function lambda = initialise_ergodicOrNonergodic(N,M,D,flag)
	
	%ergodic
	lambda{1} = N;
	lambda{2} = M;
	%initialise A
	A = ones(N,N);
	A = A./N;
	lambda{3} = A;
	%initialise Pis
	Pi = ones(N,1);
	Pi = Pi./N;
	lambda{5} = Pi;

	% O
	% D
	% size(D)
	%initialise Bj(Vk)
	B = zeros(N,M);
	for i = 1:size(D)(2)
		O = D{i};
		Q = 0;
		% O'
		segment_size = ceil((size(O)(1))/N);
		k = 1;
		for j = 1:size(O)(1)
			Q(j,1) = k;
			if(mod(j,segment_size) == 0)
				k += 1;
			end
		end
		% Q'
		for j = 1:N
			j_ctr = 0;
			for z = 1:size(O)(1)
				if(Q(z,1)==j)
					j_ctr += 1;
				end
			end
			for k = 1:M
				jVk_ctr = 0;
				for z = 1:size(O)(1)
					if(Q(z,1)==j && O(z,1)==k)
						jVk_ctr += 1;
					end

				end
				if(j_ctr>0)
					B(j,k) += jVk_ctr/j_ctr;
				end

			end

		end
	end
	B = B./length(D);
	lambda{4} = B;
	% B
	if(flag ==1)
		%non ergodic
		A = lambda{3};
		for i=1:size(A)(1)
			for j=1:size(A)(2)
				if(i>j)
					A(i,j)=0;
				end
			end
		end
		lambda{3}=A;

		%change Pis
		Pi = zeros(N,1);
		Pi(1,1)=1;
		lambda{5}=Pi;
	end


end