[train,test] = datasets_speech();
% [train,test] = datasets_image();


num_code_vectors = 64;
num_states = 2;
flag = 1; %0-ergodic, 1-left to right

num_train = size(train{1})(2)+size(train{2})(2)+size(train{3})(2);
num_test = size(test{1})(2)+size(test{2})(2)+size(test{3})(2);
% vertcat(train')
% % train{1}
% % train{2}

confusion_matrix = zeros(3,3);

%%%%%%%%%Vector Quantization%%%%%%%%%%%%%%
% test{1}{1}
% train{1}{5}
disp('Vector Quantizing')
[train,test] = VQ(train,test,num_code_vectors);
% train{1}{5}
% test{1}{1}



%%%%%%%%%%%%%%Training%%%%%%%%%%%%%%%%%%%
lambda = cell(3,1);
for i = 1:3,
	N = num_states;
	M = num_code_vectors;
	fprintf(stderr,"Class %d\n",i);
	lambda{i} = buildDHMM(train{i},N,M,flag); %%N M will be needed,flag 0-ergodic, 1- non ergodic
	D = train{i};
	ReturnP = 0;
	for z = 1:length(D)
		
		ReturnP += log(P_DHMM(D{z},lambda{i}));
		
	end
	ReturnP
end


%%%%%%%%%%%%%%Testing%%%%%%%%%%%%%%%%%%%%
for i = 1:3
	for j = 1:size(test{i})(2) %%loop to get all test data of class i
		predicted_label = 1;
		actual_label = i;
		p = 0;
		% tmp = 
		for k = 1:3 %%loop through all the models(lambdas)
			tmp(k,1) = log(P_DHMM(test{i}{j},lambda{k}));%%posterior prob of test ex wrt class k
			% if(tmp>p)
			% 	p = tmp;
			% 	predicted_label = k;
			% end
		end
		[a,predicted_label] = max(tmp);
		confusion_matrix(actual_label,predicted_label) += 1;
	end
end

%%%%%%%%%print stats%%%%%%%%%%%%%
num_code_vectors
num_states
confusion_matrix
accuracy = sum(diag(confusion_matrix)/num_test)

