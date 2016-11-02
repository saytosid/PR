[train,test] = datasets_speech();
% train{1}{1}
% train{1}{2}
num_code_vectors = 5;
num_states = 5;
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
	printf("Class %d\n",i);
	lambda{i} = buildDHMM(train{i},N,M); %%N M will be needed
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
confusion_matrix
accuracy = sum(diag(confusion_matrix)/num_test)

