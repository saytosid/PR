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
	m = floor(m);
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
	m = floor(0.75 * n) + 1;	
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

	% % plotting region

    figure(203);
   pts = [0 0];
   for i = -10:0.8:30,
    for j = -20:0.8:20,
      pts = [pts;i j];
    end;
   end;
   for i = 1:length(pts);
     p = 0;
     q = 0;
     r = 0;
     x = [pts(i,1) pts(i,2)];
     for j=1:k,
	     p = p + Pi(j,1) * normal(x(1,:) , Mean(j,:) , Cov(:,:,j));
		 q = q + PiY(j,1) * normal(x(1,:) , MeanY(j,:) , CovY(:,:,j));
		 r = r + PiZ(j,1) * normal(x(1,:) , MeanZ(j,:) , CovZ(:,:,j));
	     a = [p q r];
	     a = max(a);
	     if a == p,
	        p1=plot(x(1),x(2),'y');
	          hold on;
	          % ++tc1;
	     end;     
	     if a == q,
	        plot(x(1),x(2),'c');
	          hold on;
	          % ++tp2;
	      end;    
	     if a == r,
	        plot(x(1),x(2),'Color',[0,0.5,0.3]);
	          hold on;
	          % ++tp2;
	      end;
	     end;     
   end;

   %training data
   n = rows(X);
   m1 = floor(0.75 * n);
   for i = 1:m1,
      x = [X(i,1)  X(i,2)];
      x = x';
      p1=plot(x(1),x(2),'MarkerSize',8,'g');
      hold on;
    end;
    
    n = rows(Y);
   m2 = floor(0.75 * n);
   for i = 1:m2,
      x = [Y(i,1)  Y(i,2)];
      x = x';
      p2=plot(x(1),x(2),'MarkerSize',8,'b');
      hold on;
    end;

    n = rows(Z);
   m3 = floor(0.75 * n);
    for i = 1:m3,
      x = [Z(i,1)  Z(i,2)];
      x = x';
      p3=plot(x(1),x(2),'MarkerSize',8,'m');
      hold on;
    end;

   xlabel('X coordinate');
   ylabel('Y coordinate');
   title('Linearly Separable Dataset(K = 3)');
   legend([p1,p2,p3],'Class1','Class2','Class3');
   print -djpg LS2.jpg;
   hold off;

 % %plotting region C1,C2
 %   figure(204);
 %   for i = 1:length(pts);
 %   	 p=0;
 %   	 q=0;
 %     x = [pts(i,1); pts(i,2)];
	%  for j = 1:k,
	%      p = p + Pi(j,1) * normal(x(1,:) , Mean(j,:) , Cov(:,:,j));
	% 	 q = q + PiY(j,1) * normal(x(1,:) , MeanY(j,:) , CovY(:,:,j));
	% 	 % r = r +	PiZ(j,1) * normal(x(i,:) , MeanZ(j,:) , CovZ(:,:,j));
	%      a = [p q];
	%      a = max(a);
	%      if a == p,
	%         p1=plot(x(1),x(2),'y');
	%           hold on;
	%           % ++tc1;
	%      end;     
	%      if a == q,
	%         plot(x(1),x(2),'c');
	%           hold on;
	%           % ++tp2;
	%       end;    
	%      %  if a == g3,
	%      %    plot(x(1),x(2),'Color',[0,0.5,0.3]);
	%      %      hold on;
	%      %      % ++tp3;
	%      % end;
	%      end;     
 %   end;

 %   %next 2 loops plot points of C1 and C2
 %   n = rows(X);
 %   m1 = floor(0.75 * n);
 %   for i = 1:m1,
 %      x = [X(i,1)  X(i,2)];
 %      x = x';
 %      p1=plot(x(1),x(2),'g');
 %      hold on;
 %    end;
 %   n = rows(Y);
 %   m2 = floor(0.75 * n);
 %   for i = 1:m2,
 %      x = [Y(i,1)  Y(i,2)];
 %      x = x';
 %      p2=plot(x(1),x(2),'b');
 %      hold on;
 %    end;   
 %   xlabel('x coordinate');
 %   ylabel('y coordinate');
 %   title('Real Data C1,C2');
 %   legend([p1,p2],'Class1','Class2');
 %   print -djpg Real_C1_c2_k=3.jpg;
 %   hold off;

 %   % plotting region C1,C3
 %   figure(214);
 %   for i = 1:length(pts);
 %   	 p=0;
 %   	 q=0;
 %   	 r =0;
 %     x = [pts(i,1); pts(i,2)];
	%  for j = 1:k,
	%      p = p + Pi(j,1) * normal(x(1,:) , Mean(j,:) , Cov(:,:,j));
	% 	 % q = q + PiY(j,1) * normal(x(1,:) , MeanY(j,:) , CovY(:,:,j));
	% 	 r = r + PiZ(j,1) * normal(x(1,:) , MeanZ(j,:) , CovZ(:,:,j));
	%      a = [p r];
	%      a = max(a);
	%      if a == p,
	%         p1=plot(x(1),x(2),'y');
	%           hold on;
	%           % ++tc1;
	%      end;     
	%      % if a == q,
	%      %    plot(x(1),x(2),'c');
	%      %      hold on;
	%      %      % ++tp2;
	%      %  end;    
	%       if a == r,
	%         plot(x(1),x(2),'Color',[0,0.5,0.3]);
	%           hold on;
	%           % ++tp3;
	%      end;
	% end;     
 %   end;

 %   %next 2 loops plot points of C1 and C3
 %   n = rows(X);
 %   m1 = floor(0.75 * n);
 %   for i = 1:m1,
 %      x = [X(i,1)  X(i,2)];
 %      x = x';
 %      p1=plot(x(1),x(2),'g');
 %      hold on;
 %    end;
 %   n = rows(Z);
 %   m2 = floor(0.75 * n);
 %   for i = 1:m2,
 %      x = [Z(i,1)  Z(i,2)];
 %      x = x';
 %      p2=plot(x(1),x(2),'m');
 %      hold on;
 %    end;   
 %   xlabel('x coordinate');
 %   ylabel('y coordinate');
 %   title('Real Data C1,C3');
 %   legend([p1,p2],'Class1','Class3');
 %   print -djpg Real_C1_c3_k=3.jpg;
 %   hold off;

 %   % plotting region C2,C3
 %   figure(215);
 %   for i = 1:length(pts);
 %   	 p=0;
 %   	 q=0;
 %   	 r = 0;
 %     x = [pts(i,1); pts(i,2)];
	%  for j = 1:k,
	%      % p = p + Pi(j,1) * normal(x(1,:) , Mean(j,:) , Cov(:,:,j));
	% 	 q = q + PiY(j,1) * normal(x(1,:) , MeanY(j,:) , CovY(:,:,j));
	% 	 r = r + PiZ(j,1) * normal(x(1,:) , MeanZ(j,:) , CovZ(:,:,j));
	%      a = [q r];
	%      a = max(a);
	%      % if a == p,
	%      %    p1=plot(x(1),x(2),'y');
	%      %      hold on;
	%      %      % ++tc1;
	%      % end;     
	%      if a == q,
	%         plot(x(1),x(2),'c');
	%           hold on;
	%           % ++tp2;
	%       end;    
	%       if a == r,
	%         plot(x(1),x(2),'Color',[0,0.5,0.3]);
	%           hold on;
	%           % ++tp3;
	%      end;
	% end;     
 %   end;

 %   %next 2 loops plot points of C2 and C3
 %   n = rows(Y);
 %   m1 = floor(0.75 * n);
 %   for i = 1:m1,
 %      x = [Y(i,1)  Y(i,2)];
 %      x = x';
 %      p1=plot(x(1),x(2),'b');
 %      hold on;
 %    end;
 %   n = rows(Z);
 %   m2 = floor(0.75 * n);
 %   for i = 1:m2,
 %      x = [Z(i,1)  Z(i,2)];
 %      x = x';
 %      p2=plot(x(1),x(2),'m');
 %      hold on;
 %    end;   
 %   xlabel('x coordinate');
 %   ylabel('y coordinate');
 %   title('Real Data C2,C3');
 %   legend([p1,p2],'Class2','Class3');
 %   print -djpg Real_C2_c3_k=3.jpg;
 %   hold off;



end;
