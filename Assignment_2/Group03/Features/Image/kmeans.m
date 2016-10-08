function [Mean,covk,Pi] = kmeans(X,k,len)

	X = X';
	disp('hi kmeans starts...\n')
	m = rows(X);
	m = m/len;
	m1 = len - 1;					% total number of examples
	d = columns(X);					% dimensions
	n = k + 1;

	% w = m/(k+1);
	% w = floor(w);
	m = rows(X);
	j = 1;
	for i = 1:k,
		 % q = (i*w*len)+1;										%take first k elements of X as initial means
		Mean(:,:,i) = X(j:(j+(m1)),:);
		j = j + len;
	end;
	     Meani = Mean;
	diff = ones(len , d);
	j = 0;
	u = 0;

	while (u<=1),
	j = j + 1; 
	u = u + 1;
	a = zeros(len , d , k);
	num = zeros(k , 1);
	cluster = zeros(m , 1);
	m = rows(X);
	for i = 1:len:m,
		g = arg_min_dist(X(i:(i+(m1)),:),Mean);
		a(:,:,g) = a(:,:,g) + X(i:(i+(m1)),:);
		num(g,1) = num(g,1) + 1;
		cluster(i,1) = g;
	end;
	
	for i = 1:k,
		a(:,:,i) = a(:,:,i)/num(i,1);
	end;
		
	diff = abs(a-Mean);
	Mean = a;
		
	if (diff > 0) == zeros(len , d),
		break;
	end;	
end;

covk = zeros(d,d,k);
l=1;


 
for j=1:k,
	for i=1:len:m,
		if(cluster(i,1) == j),
			sum1(:,:) = X(i:(i+(m1)),:);
			if(sum1 == Mean(:,:,j))
				disp('h');
			end;	
			sum1 = sum1 - Mean(:,:,j);
			covk(:,:,j) = covk(:,:,j) + sum1'*sum1;
			l = l+1;
		end;
	end;

	covk(:,:,j) = covk(:,:,j)/num(j,1);	
end;
   % covk
    num

Pi = zeros(k,1);
m = m/len;
for i=1:k,
	Pi(i,1) = num(i,1)/m;
end;	 			

disp('Kmeans ends...\n');
u
	% Meani
	% if Meani(:,:,1) == a(:,:,1) ,
 % 		disp('gone'); 
	% end;
 % 	if Meani(:,:,2) == a(:,:,2) ,
 % 		disp('gone2'); 
	% end;	
end;