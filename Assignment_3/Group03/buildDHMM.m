function lambda = buildDHMM(D,N,M)
%D is the set of training examples of a class i(D == train(i))
%lambda is the model for class i
%This function is desired to build HMM model for a class i

%%%REQUIREMENTS%%%%
%P_DHMM - P(O|lambda)
%ZETA(i,j,alphaa,beeta,A,B,O,t,N)
% alphaa = forward(lambda , O, T)
% beeta = backward(lambda , O, T)
% R(i,alphaa,beeta,t,N)
lambda = cell(5,1);
%step1 Initialisation

lambda = initialise_ergodicOrNonergodic(N,M,D,1);%0-ergodic, 1- non ergodic
THRESHOLD = 0.01;

%P(D|lambda)
prevP = 0;
for i = 1:length(D)
	if(P_DHMM(D{i},lambda) > 0 && P_DHMM(D{i},lambda) < 1)
		prevP += log(P_DHMM(D{i},lambda));
	end
end
% prevP = log(prevP);
while(true)

	fprintf(stderr,"P = %f \n",prevP);
	%Step2-Estep
	alphaa = cell(length(D),1);%alphaa is a cell array, each element is alpha(T,N) matrix of alpha values for that Observation sequnce
	beeta = cell(length(D),1);
	zeeta = cell(length(D),1);
	A = lambda{3};
	B = lambda{4};
	Pi = lambda{5};
	R_ = cell(length(D),1);
	for l = 1:length(D)
		alphaa{l} = forward(lambda,D{l},length(D{l}));
		beeta{l} = backward(lambda,D{l},length(D{l}));
			
		for t = 1:length(D{l})
			R_{l}{t} = zeros(N,1);
			for i = 1:N
				R_{l}{t}(i,1) = R(i,alphaa{l},beeta{l},t,N);
				for j = 1:N
					if(t<length(D{l}))
						zeeta{l}{t}(i,j) = ZETA(i,j,alphaa{l},beeta{l},A,B,D{l},t,N);
					end
				end
			end
		end
		

	end

	%step3 MStep
	Pi = zeros(N,1);
	A = zeros (N,N);
	B = zeros(N,M);
	for i = 1:N %for all states
		denom = 0;
		for l = 1:length(D)
			Pi(i,1) += R_{l}{1}(i,1);
			for t = 1:(length(D{l})-1)
					denom += R_{l}{t}(i,1);
			end 
			for j = 1:N
				%%For A(i,j)
				numerator = 0;
				% denom = 0;
				for t = 1:(length(D{l})-1)
					numerator += zeeta{l}{t}(i,j);
					% denom += R_{l}{t}(i,1);
				end 
				if(numerator>0 && denom>0)
					A(i,j) += numerator/denom;
					% A(i,j)
				end
				A(i,j) /= length(D);
			end
		end
		Pi(i,1) /= length(D); 
		% A(i,j) /= length(D);
		% length(D)
		
		%%for Bj(Vk), here Bi(v)
		
		for v = 1:M
			for l = 1:length(D)
				numerator = 0;
				denom = 0;
				for t = 1:(length(D{l}))
					denom += R_{l}{t}(i,1);
					if(D{l}(t,1) == v)
						numerator += R_{l}{t}(i,1);
					end
				end
				if(numerator>0)
					B(i,v) += numerator/denom;
				end
			end
			B(i,v) /= length(D);
		end
		
	end
	lambda{4} = B;
	lambda{3} = A;
	lambda{5} = Pi;

	newP = 0;
	for l = 1:length(D)
		% P_DHMM(D{l},lambda)
		if(P_DHMM(D{l},lambda) > 0 && P_DHMM(D{l},lambda) < 1)
			newP += log(P_DHMM(D{l},lambda));
		end
		if(P_DHMM(D{l},lambda) > 1)
			fprintf(stderr,"Error, Probability greater than 1\n");
			% P_DHMM(D{l},lambda)
		end
	end
	% newP
	% newP = log(newP);
	if(abs(newP - prevP) < THRESHOLD)
		return;
	end
	if(abs(newP - prevP) > THRESHOLD)
		prevP = newP;
	end

end
end