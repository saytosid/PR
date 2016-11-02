function lambda_max	 = buildDHMM(D,N,M)
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
lambda_max = lambda;
THRESHOLD = 0.1;
cutoff_ctr = 0;
cutoffThreshold = 5;
THRESHOLD = 0.01;
%P(D|lambda)
prevP = 0;
for i = 1:length(D)
	if(P_DHMM(D{i},lambda) > 0 && P_DHMM(D{i},lambda) < 1)
		prevP += log(P_DHMM(D{i},lambda));
	end
end
% prevP = log(prevP);
% prevP
% return;
delta_old = 0;
while(true)

	% fprintf(stderr,"P = %f \n",prevP);
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

	sad = 0;
	for j = 1:N,
		sad += zeeta{1}{2}(3,j);
	end;
	if(sad == R_{1}{2}(3,1)),
		fprintf(stderr,"good\n");	
	end

	%step3 MStep
	Pi = zeros(N,1);
	A = zeros (N,N);
	B = zeros(N,M);
	for i = 1:N %for all states
		denom = 0;
		for l = 1:length(D)
			Pi(i,1) += R_{l}{1}(i,1);
		end
		Pi(i,1) /= length(D); 

		% For A(i,j)
		for l=1:length(D)
			denom = 0; %same for all j hence out of j loop
			for t = 1:(length(D{l})-1)
				denom += R_{l}{t}(i,1);
			end
			%denom done

			%for numerator
			numerator = 0;
			for j = 1:N
				for t = 1:(length(D{l})-1)
					numerator += zeeta{l}{t}(i,j);
				end
				A(i,j) += (numerator/denom);
			end

		end
		A = A./length(D);
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
		
	% end
	lambda{4} = B;
	lambda{3} = A;
	lambda{5} = Pi;

	newP = 0;
	for z = 1:length(D)
		
		newP += log(P_DHMM(D{z},lambda));
		
	end
	%convergence, check here
	delta = ((newP - prevP));
	if(delta > 0)
		lambda_max = lambda;
	end
	if(delta < 0)
		if(cutoff_ctr == cutoffThreshold)
			ReturnP = 0;
			for z = 1:length(D)
				
				ReturnP += log(P_DHMM(D{z},lambda_max));
				
			end
			ReturnP
			return;
		end
		cutoff_ctr += 1;
	end
	
	fprintf(stderr,"PrevP = %f NewP = %f delta = %f Threshold = %f \n",prevP,newP, delta,THRESHOLD);
	prevP = newP;
	

end
end