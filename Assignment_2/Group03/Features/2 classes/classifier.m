function [] = classifier(X,Y,k)

disp('classifier starts ..');

	n = rows(X);
	m = floor(0.75 * n);
	X1 = X(1:m,:);						% X1 contains training data for C1
	
	n = rows(Y);
	m = floor(0.75 * n);
	Y1 = Y(1:m,:);						% Y1 contains training data for C2 

	[Mean,Cov,Pi] = GMM(X1,k);       
	[MeanY,CovY,PiY] = GMM(Y1,k);
	figure(100);
	tc1 = 0;
	tc2 = 0;
	tp1 = 0;
	tp2 = 0;
	
	n = rows(X);
	m = floor(0.75 * n) + 1;
	for i=m:n,
		p = 0;
		q = 0;
		for j=1:k,
			p = p + Pi(j,1) * normal(X(i,:) , Mean(j,:) , Cov(:,:,j));
			q = q + PiY(j,1) * normal(X(i,:) , MeanY(j,:) , CovY(:,:,j));		
		end;
		if (p>q),
			plot(X(i,1),X(i,2),'g');
			tc1 = tc1 + 1;
			hold on;
			end;			
		if (q>=p),
			plot(X(i,1),X(i,2),'b');
			tp2 = tp2 + 1;
			hold on;
		end;
	end;		

	n = rows(Y);
	m = (0.75 * n) + 1;	
	for i=m:n,
		p = 0;
		q = 0;
		for j=1:k,
			p = p + Pi(j,1) * normal(Y(i,:) , Mean(j,:) , Cov(:,:,j));
			q = q + PiY(j,1) * normal(Y(i,:) , MeanY(j,:) , CovY(:,:,j));		
		end;
		if (p>q),
			plot(Y(i,1),Y(i,2),'g');
			tp1 = tp1 + 1;
			hold on;
			end;			
		if (q>=p),
			plot(Y(i,1),Y(i,2),'b');
			tc2 = tc2 + 1;
			hold on;
		end;
	end;

	tp1 = tp1 + tc1;
	tp2 = tp2 + tc2;
	tc1
	tc2
	tp1
	tp2


end;
