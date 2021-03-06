function [train test] = datasets_image()    %%dir1-3 : training data, dir4-6 : test data
	num_classes = 3;
	train = cell(num_classes,1);
	test = cell(num_classes,1);

	dir1 = 'TrainI/coast/';
	dir2 = 'TrainI/insidecity/';
	dir3 = 'TrainI/mountain/';
	dir4 = 'TestI/coast/';
	dir5 = 'TestI/insidecity/';
	dir6 = 'TestI/mountain/';

	Files1 = dir(strcat(dir1,'*.jpg_color_edh_entropy'));
	Files2 = dir(strcat(dir2,'*.jpg_color_edh_entropy'));
	Files3 = dir(strcat(dir3,'*.jpg_color_edh_entropy'));
	Files4 = dir(strcat(dir4,'*.jpg_color_edh_entropy'));
	Files5 = dir(strcat(dir5,'*.jpg_color_edh_entropy'));
	Files6 = dir(strcat(dir6,'*.jpg_color_edh_entropy'));

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
