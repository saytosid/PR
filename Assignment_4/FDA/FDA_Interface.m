function [] = FDA_Interface()

	%%%%%%%%%%%%% enter path as argument %%%%%%%%%%%%%%%%%%
	[TrainData , TestData] = datasets(' ');     

	%%%%%%%%%%%% 1D data with maximum discrimination %%%%%%%%%%
	[reducedTrain , reducedTest] = FDA(TrainData , TestData);

	%%%%%%%%%%%% classify data with GMM %%%%%%%%%%%%%%%%%
	clusters = ;
	classifier(reducedTrain , reducedTest , clusters); 

	%%%%%%%%%%%% plot the 1D data (plot boundary superposed with training data) %%%%%%%%%%%%%%%%%%%%%%%
	plotData(reducedTrain , reducedTest)

end	