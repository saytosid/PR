function [] = FDA_Interface()

	%%%%%%%%%%%%% enter path as argument %%%%%%%%%%%%%%%%%%
	[TrainData , TestData] = datasets('rd_group3/');  %Pass the relative path to the data sets(M .txt files denoting M classes), with a trailing '/'    
	clusters = 20
	%%%%%%%%%%%% 1D data with maximum discrimination %%%%%%%%%%
	FDA(TrainData , TestData,clusters);


	

	%%%%%%%%%%%% plot the 1D data (plot boundary superposed with training data) %%%%%%%%%%%%%%%%%%%%%%%
	% plotData(reducedTrain , reducedTest)

end	