function [] = kmeans(X,k)

m = length(X);
n = k + 1;
for i = 1:k,			%take first k elements of X as initial means
	Mean(i,:) = X(i*50,:);
end;	

diff = ones(k , columns(X));
j = 0;

while (diff > 0.1),
	j = j + 1; 
	a = zeros(k , columns(X));
	figure(j);
	for i = 1:m,
		g = arg_min_dist(X(i,:),Mean);
		a(g,:) = a(g,:) + X(i,:);
							
		if (g==1),
			plot(X(i,1) , X(i,2) , 'y');
			hold on;
		end;	
		if (g==2),
			plot(X(i,1) , X(i,2) , 'b');
			hold on;
		end;
		if (g==3),
			plot(X(i,1) , X(i,2) , 'm');
			hold on;
		end;
		if (g==4),
			plot(X(i,1) , X(i,2) , 'c');
			hold on;
		end;
		if (g==5),
			plot(X(i,1) , X(i,2) , 'g');
			hold on;
		end;			
	end;
	
	a = a/4;
	diff = abs(a-Mean);
	Mean = a
	hold off;

end;	

end;
