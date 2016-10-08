function [l] = likelihood(X,Mean,Cov,Pi)

	l = 0;
	[i,d,n]= size(X);
	k = rows(Pi);
	c = 0;
	len = i/n;
	for i=1:n,								% to traverse each file 36x23
		for q = 1:len,						% to traverse each of 36 lines	
			c = 0;
			for j=1:k,
				a = (X(q,:,i)-Mean(q,:,j));
				Cov1 = a'*a;
				c = c + Pi(j,1) * normal(X(q,:,i),Mean(q,:,j),Cov1);
			end;
			c = log(c);
			l = l + c;
		end;		
	end;	
end;