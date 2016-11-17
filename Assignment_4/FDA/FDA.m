function [reducedTrain,reducedTest] = FDA(TrainData , TestData)
	%One-against-one approach = 6 FDAs for 3 class problem
	clusters = 1;

	omegas = cell(length(TrainData)*(length(TrainData)-1),1); %Omegas{i} = direction of projection for ith FDA	
	reducedTrain = cell(length(TrainData)*(length(TrainData)-1),1);
	reducedTest = cell(length(TrainData)*(length(TrainData)-1),1);
	GMM_ = cell(length(TrainData)*(length(TrainData)-1),1);
	ctr = 1;
	for i = 1:length(TrainData)
		for j = 1:length(TrainData)
			if(i!=j)
				omegas{ctr} = getDirection2ClassFDA(TrainData{i},TrainData{j});
				reducedTrain{ctr} = projectTrainData(TrainData{i},TrainData{j},omegas{ctr}); %Reduced data for particular 2 class FDA
				% reducedTest{ctr} = projectTrainData(TestData{i},TestData{j},omegas{ctr});  %simalar projection for test data as well
				% size(reducedTrain{ctr}{1})
				ctr += 1;
			end
		end
	end
	

	%%%%%%%%%%Build GMM%%%%%%%%%%%%%
	ctr = 1;
	for i = 1:length(TrainData)
		for j = 1:length(TrainData)
			if(i!=j)
				[GMM_{ctr}{1}{1} GMM_{ctr}{1}{2} GMM_{ctr}{1}{3}] = GMM(reducedTrain{ctr}{1},clusters); %reducedTrain{ctr} is the data of classi and classj reduced to 1-d
				%GMM{ctr}{1} has the params of GMM for class1 of ctr(th) GMM classifier
				[GMM_{ctr}{2}{1} GMM_{ctr}{2}{2} GMM_{ctr}{2}{3}] = GMM(reducedTrain{ctr}{2},clusters);
				ctr += 1;
			end
		end
	end
	% GMM_{1}
	% fprintf(stderr,"Begin Classification");
	confusion_matrix = zeros(length(TestData),length(TestData));
	ctr = 1;
	for actual_label = 1:length(TestData)
		for k = 1:length(TestData{actual_label})
			X_orig = TestData{actual_label}(k,:);
			%every test sample is fed into every classifier
			votes = zeros(length(TrainData),1); %to stores votes in MAX WIN VOTING (one against one)
			TMDF = zeros(length(TrainData),1); % to store TMDF from each test sample
			ctr = 1;
			for i = 1:length(TrainData)
				for j = 1:length(TrainData)
					if(i<j)
						
								X = X_orig*omegas{ctr};
								g_x = (g(X,GMM_{ctr}{1},clusters)) - (g(X,GMM_{ctr}{2},clusters));
								TMDF(i,1) += abs(g_x);
								TMDF(j,1) += abs(g_x);
								if(g_x > 0)
									%class i
									votes(i,1) += 1;
								else
									%class j
									votes(j,1) += 1;
								end


						
						ctr += 1;
					end
				end
			end
			[a,predicted_label] = max(votes);
			count = sum(votes(:) == max(votes));
			if(count>1)
				%check TMDF
				[a,predicted_label] = max(TMDF);
			end
			confusion_matrix(actual_label,predicted_label) += 1;
		end
	end

	confusion_matrix
	acc = sum(diag(confusion_matrix))/(length(TestData{1})+length(TestData{2})+length(TestData{3}))
	%%%%%%%%%%%% classify data with GMM %%%%%%%%%%%%%%%%%
	
	% classifier(reducedTrain , reducedTest , clusters); 

end