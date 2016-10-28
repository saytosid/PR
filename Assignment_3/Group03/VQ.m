function [labelTrain,labelTest] = VQ(train,test,num_code_vectors)
%%Performs vector quantisation on training and test data
%%concat the train data and use K_Means to find K code vectors then encode the train and test based on them

num_class = size(train,1);
for i = 1:num_class,
	flattenedTrain = vertcat(train{i}{1:end});
	flattenedTest = vertcat(test{i}{1:end});
end	
means = cell(num_code_vectors , 1);
means = k_means_algo(flattenedTrain,num_code_vectors);  %1x39
s = size(means{1},2);
K_Means = zeros(num_code_vectors , s);

s = size(means,1);
for i = 1:s,
	K_Means(i,:) = means{i};
end;	

labelTrain = cell(num_class,1);

for i = 1:num_class,
	n = size(train{i},2);
	for j = 1:n,
		m = size(train{i}{j},1);
		for l = 1:m,
			X = train{i}{j}(l,:);
			labelTrain{i}{j}(l,1) = arg_min_dist(X , K_Means);
		end	
	end	
end

labelTest = cell(num_class,1);

for i = 1:num_class,
	n = size(test{i},2);
	for j = 1:n,
		m = size(test{i}{j},1);
		for l = 1:m,
			X = test{i}{j}(l,:);
			labelTest{i}{j}(l,1) = arg_min_dist(X , K_Means);
		end	
	end	
end	

labelTest;
end