function [] = FDA_Interface()

	%%%%%%%%%%%%% enter path as argument %%%%%%%%%%%%%%%%%%
	[TrainData , TestData] = datasets('LS_Group3/');  %Pass the relative path to the data sets(M .txt files denoting M classes), with a trailing '/'    

	%%%%%%%%%%%% 1D data with maximum discrimination %%%%%%%%%%
	FDA(TrainData , TestData);

	%%%%%%%%%%%% classify data with GMM %%%%%%%%%%%%%%%%%
	clusters = 1;
	% classifier(reducedTrain , reducedTest , clusters); 

	%%%%%%%%%%%% plot the 1D data (plot boundary superposed with training data) %%%%%%%%%%%%%%%%%%%%%%%
	% plotData(reducedTrain , reducedTest)

end	