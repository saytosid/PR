[train,test] = datasets_image();
% train{1}{1}
% train{1}{2}
K = 12
num_train = size(train{1})(2)+size(train{2})(2)+size(train{3})(2)
num_test = size(test{1})(2)+size(test{2})(2)+size(test{3})(2)
% vertcat(train')
% % train{1}
% % train{2}
test_concat = cell(1,1);
itr = 1;
for i = 1:3
	for j = 1:size(test{i})(2)
		test_concat{itr} = test{i}{j};
		itr = itr+1;
	end
end
test_concat;
confusion_matrix = zeros(3,3);
for i = 1:3
	for w = 1:size(test{i})(2);
		DTWs = cell(num_train,1); %DTW distances of a test example from every training example

		itr = 1;
		for j = 1:3
			for k = 1:size(train{j})(2)
				DTWs{itr} = [DTW(train{j}{k},test{i}{w}), j, i]; %Each entry in DTWs is a vector [dtw_dist, reference_class, actual_class]
				
				itr = itr+1;
			end
		end
		%%%%%%%%%%Getting K Minimum Values%%%%%%%%%
		K_mins = cell(K,1);
		itr = 1;
		for j = 1:K
			minm = DTWs{1};
			for k = 1:length(DTWs)
				if(DTWs{k}(1)<minm(1))
					minm = DTWs{k};
				end
			end
			K_mins{itr} = minm;
			DTWs{minm(2)} = 9999999999;
			itr = itr + 1;
		end

		K_mins; %has the K_nearest_neighbors_information for one test example
		K_i = cell(3,1);
		for j = 1:3
			K_i{j} = 0;
		end
		%%%%%%%%%%%%Predicting%%%%%%%%%%%%%
		for k = 1:K
			index = K_mins{k}(2);
			K_i{index} = K_i{index}+1;
			% val = K_i{index}	
		end
		maxm=0;
		predicted_label = 0;
		
		K_i;
		for j = 1:3
			if(K_i{j} > maxm)
				maxm = K_i{j};
				predicted_label = j;
			end
		end
		predicted_label;
		actual_label = i;
		confusion_matrix(actual_label,predicted_label) += 1;


	
	end
	

end
%%%%Print stats%%%%%%
confusion_matrix
accuracy = sum(diag(confusion_matrix))/num_test