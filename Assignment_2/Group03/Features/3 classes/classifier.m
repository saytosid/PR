function [] = classifier(X,Y,Z,k)

disp('classifier starts ..');

	n = rows(X);
	m = floor(0.75 * n);
	X1 = X(1:m,:);						% X1 contains training data for C1
	
	n = rows(Y);
	m = floor(0.75 * n);
	Y1 = Y(1:m,:);						% Y1 contains training data for C2

	n = rows(Z);
	m = floor(0.75 * n);
	Z1 = Z(1:m,:);						% Z1 contains training data for C3 

	[Mean,Cov,Pi] = GMM(X1,k);       
	[MeanY,CovY,PiY] = GMM(Y1,k);
	[MeanZ,CovZ,PiZ] = GMM(Z1,k);
	figure(100);
	tc1 = 0;
	tc2 = 0;
	tc3 = 0;
	tp1 = 0;
	tp2 = 0;
	tp3 = 0;
	t12 = 0;
	t13 = 0;
	t21 = 0;
	t23 = 0;
	t32 = 0;
	t31 = 0;
	
	n = rows(X);
	m = floor(0.75 * n) + 1;
	for i=m:n,
		p = 0;
		q = 0;
		r = 0;
		for j=1:k,
			p = p + Pi(j,1) * normal(X(i,:) , Mean(j,:) , Cov(:,:,j));
			q = q + PiY(j,1) * normal(X(i,:) , MeanY(j,:) , CovY(:,:,j));
			r = r +	PiZ(j,1) * normal(X(i,:) , MeanZ(j,:) , CovZ(:,:,j));	
		end;
		G = [p,q,r];
		g = max(G);
		if (g == p),
			plot(X(i,1),X(i,2),'g');
			tc1 = tc1 + 1;
			hold on;
			end;			
		if (g == q),
			plot(X(i,1),X(i,2),'b');
			tp2 = tp2 + 1;
			t12 = t12 + 1;
			hold on;
		end;
		if (g == r),
			plot(X(i,1),X(i,2),'m');
			tp3 = tp3 + 1;
			t13 = t13 + 1;
			hold on;
		end;
	end;		

	n = rows(Y);
	m = (0.75 * n) + 1;	
	for i=m:n,
		p = 0;
		q = 0;
		r = 0;
		for j=1:k,
			p = p + Pi(j,1) * normal(Y(i,:) , Mean(j,:) , Cov(:,:,j));
			q = q + PiY(j,1) * normal(Y(i,:) , MeanY(j,:) , CovY(:,:,j));
			r = r +	PiZ(j,1) * normal(Y(i,:) , MeanZ(j,:) , CovZ(:,:,j));	
		end;
		G = [p,q,r];
		g = max(G);
		if (g == p),
			plot(Y(i,1),Y(i,2),'g');
			tp1 = tp1 + 1;
			t21 = t21 + 1;
			hold on;
			end;			
		if (g == q),
			plot(Y(i,1),Y(i,2),'b');
			tc2 = tc2 + 1;
			hold on;
		end;
		if (g == r),
			plot(Y(i,1),Y(i,2),'m');
			tp3 = tp3 + 1;
			t23 = t23 + 1;
			hold on;
		end;
	end;

	n = rows(Z);
	m = (0.75 * n) + 1;	
	for i=m:n,
		p = 0;
		q = 0;
		r = 0;
		for j=1:k,
			p = p + Pi(j,1) * normal(Z(i,:) , Mean(j,:) , Cov(:,:,j));
			q = q + PiY(j,1) * normal(Z(i,:) , MeanY(j,:) , CovY(:,:,j));
			r = r +	PiZ(j,1) * normal(Z(i,:) , MeanZ(j,:) , CovZ(:,:,j));	
		end;
		G = [p,q,r];
		g = max(G);
		if (g == p),
			plot(Z(i,1),Z(i,2),'g');
			tp1 = tp1 + 1;
			t31 = t31 + 1;
			hold on;
			end;			
		if (g == q),
			plot(Z(i,1),Z(i,2),'b');
			tp2 = tp2 + 1;
			t32 = t32 + 1;
			hold on;
		end;
		if (g == r),
			plot(Z(i,1),Z(i,2),'m');
			tc3 = tc3 + 1;
			hold on;
		end;
	end;		

	tp1 = tp1 + tc1;
	tp2 = tp2 + tc2;
	tp3 = tp3 + tc3;
	tc1
	tc2
	tc3
	tp1
	tp2
	tp3
	t12 
	t13 
	t21 
	t23 
	t31 
	t32 



end;
