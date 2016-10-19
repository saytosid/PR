function [classlabel] = KNN(Test , Train , K)		%Train is cell of training ex.
													%Train{i} = Training examples for class i
													%Train{i,j} = jth training example of class i
													%Test{i} = ith training example 	
	[R , C] = size(Train);							% R = no. of training examples	
	[r , c] = size(Test);							% r = no. of test ex.	
	% problem here
	
	for i = 1:r,	%ith training ex. 				
		for j = 1:R,	%jth class
			for k = 1:C,


	

end