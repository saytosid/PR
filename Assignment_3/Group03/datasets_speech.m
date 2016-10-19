function [train test] = datasets_speech()    %%dir1-3 : training data, dir4-6 : test data
	num_classes = 3;
	train = cell(num_classes,1);
	test = cell(num_classes,1);

	dir1 = 'Train/dA/';
	dir2 = 'Train/DA/';
	dir3 = 'Train/DhA/';
	dir4 = 'Test/dA/';
	dir5 = 'Test/DA/';
	dir6 = 'Test/DhA/';

	Files1 = dir(strcat(dir1,'*.mfcc'));
	Files2 = dir(strcat(dir2,'*.mfcc'));
	Files3 = dir(strcat(dir3,'*.mfcc'));
	Files4 = dir(strcat(dir4,'*.mfcc'));
	Files5 = dir(strcat(dir5,'*.mfcc'));
	Files6 = dir(strcat(dir6,'*.mfcc'));

	N1 = length(Files1);
	N2 = length(Files2);
	N3 = length(Files3);
	N4 = length(Files4);
	N5 = length(Files5);
	N6 = length(Files6);

	for i = 1:N1,
		fname = Files1(i).name;
		train{1}{i} = load([dir1,fname]);
	end

	for i = 1:N2,
		fname = Files2(i).name;
		train{2}{i} = load([dir2,fname]);
	end

	for i = 1:N3,
		fname = Files3(i).name;
		train{3}{i} = load([dir3,fname]);
	end

	for i = 1:N4,
		fname = Files4(i).name;
		test{1}{i} = load([dir4,fname]);
	end

	for i = 1:N5,
		fname = Files5(i).name;
		test{2}{i} = load([dir5,fname]);
	end

	for i = 1:N6,
		fname = Files6(i).name;
		test{3}{i} = load([dir6,fname]);
	end
	

		


end	
