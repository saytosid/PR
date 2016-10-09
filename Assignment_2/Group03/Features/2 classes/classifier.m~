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
	% figure(100);
	% tc1 = 0;
	% tc2 = 0;
	% tp1 = 0;
	% tp2 = 0;
	
	% n = rows(X);
	% m = floor(0.75 * n) + 1;
	% for i=m:n,
	% 	p = 0;
	% 	q = 0;
	% 	for j=1:k,
	% 		p = p + Pi(j,1) * normal(X(i,:) , Mean(j,:) , Cov(:,:,j));
	% 		q = q + PiY(j,1) * normal(X(i,:) , MeanY(j,:) , CovY(:,:,j));		
	% 	end;
	% 	if (p>q),
	% 		plot(X(i,1),X(i,2),'g');
	% 		tc1 = tc1 + 1;
	% 		hold on;
	% 		end;			
	% 	if (q>=p),
	% 		plot(X(i,1),X(i,2),'b');
	% 		tp2 = tp2 + 1;
	% 		hold on;
	% 	end;
	% end;		

	% n = rows(Y);
	% m = (0.75 * n) + 1;	
	% for i=m:n,
	% 	p = 0;
	% 	q = 0;
	% 	for j=1:k,
	% 		p = p + Pi(j,1) * normal(Y(i,:) , Mean(j,:) , Cov(:,:,j));
	% 		q = q + PiY(j,1) * normal(Y(i,:) , MeanY(j,:) , CovY(:,:,j));		
	% 	end;
	% 	if (p>q),
	% 		plot(Y(i,1),Y(i,2),'g');
	% 		tp1 = tp1 + 1;
	% 		hold on;
	% 		end;			
	% 	if (q>=p),
	% 		plot(Y(i,1),Y(i,2),'b');
	% 		tc2 = tc2 + 1;
	% 		hold on;
	% 	end;
	% end;

	% tp1 = tp1 + tc1;
	% tp2 = tp2 + tc2;
	% tc1
	% tc2
	% tp1
	% tp2
	
% 	for i=m:n,
% 		p = 0;
% 		q = 0;
% 		for j=1:k,
% 			p = p + Pi(j,1) * normal(X(i,:) , Mean(j,:) , Cov(:,:,j));
% 			q = q + PiY(j,1) * normal(X(i,:) , MeanY(j,:) , CovY(:,:,j));		
% 		end;
% 		if (p>q),
% 			plot(X(i,1),X(i,2),'g');
% 			tc1 = tc1 + 1;
% 			hold on;
% 			end;			
% 		if (q>=p),
% 			plot(X(i,1),X(i,2),'b');
% 			tp2 = tp2 + 1;
% 			hold on;
% 		end;
% 	end;		

% 	n = rows(Y);
% 	m = (0.75 * n) + 1;	
% 	for i=m:n,
% 		p = 0;
% 		q = 0;
% 		for j=1:k,
% 			p = p + Pi(j,1) * normal(Y(i,:) , Mean(j,:) , Cov(:,:,j));
% 			q = q + PiY(j,1) * normal(Y(i,:) , MeanY(j,:) , CovY(:,:,j));		
% 		end;
% 		if (p>q),
% 			plot(Y(i,1),Y(i,2),'g');
% 			tp1 = tp1 + 1;
% 			hold on;
% 			end;			
% 		if (q>=p),
% 			plot(Y(i,1),Y(i,2),'b');
% 			tc2 = tc2 + 1;
% 			hold on;
% 		end;
% 	end;

% 	tp1 = tp1 + tc1;
% 	tp2 = tp2 + tc2;
% 	tc1
% 	tc2
% 	tp1
% 	tp2



	%%%%%%%%%% plotting region %%%%%%%%%%

   figure(210);
   pts = [0 0];
   for i = -15:0.6:15,
    for j = -15:0.6:15,
      pts = [pts;i j];
    end;
   end;
   
   for i = 1:length(pts);
     p = 0;
     q = 0;
     x = [pts(i,1) pts(i,2)];
     for j=1:k,
	     p = p + Pi(j,1) * normal(x(1,:) , Mean(j,:) , Cov(:,:,j));
		 q = q + PiY(j,1) * normal(x(1,:) , MeanY(j,:) , CovY(:,:,j));
		 % r = r +	PiZ(j,1) * normal(x(i,:) , MeanZ(j,:) , CovZ(:,:,j));
		 end;
	     a = [p q];
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
	     %  if a == g3,
	     %    plot(x(1),x(2),'Color',[0,0.5,0.3]);
	     %      hold on;
	     %      % ++tp3;
	     % end;
	     % end;     
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

   % %  n = rows();
   % % m1 = floor(0.75 * n);
   % %  for i = 1:m3,
   % %    x = [Z1(i,1)  Z1(i,2)];
   % %    x = x';
   % %    p3=plot(x(1),x(2),'MarkerSize',9,'m');
   % %    hold on;
   % %  end;

   % % [x,y]=meshgrid(-0:50:2500,0:50:2500);
   % % i_max = size(x)(1,1);
   % % j_max = size(y)(1,2);
   % % for i = 1:1:i_max,
   % %  for j = 1:1:j_max,
   % %  	p =0;
   % %  	q =0;
   % %  	for o=1:k,
	  % %     p = p + Pi(j,1) * normal(x(1,:) , Mean(o,:) , Cov(:,:,o));
		 % %  q = q + PiY(j,1) * normal(x(1,:) , MeanY(o,:) , CovY(:,:,o));
	  % %     % z3(i,j)=g(x(i,j),y(i,j),mean3,sigma3,Pc3);
	  % %     z(i,j)=max(p,q);
	  % %   end;  
   % %  end;
   % % end;
   % % contour(x,y,z,10);
   % % hold on;
   xlabel('x coordinate');
   ylabel('y coordinate');
   title('Spiral(K = 12)');
   legend([p1,p2],'Class1','Class2');   
   print -djpg Spiral_k=12.jpg;


end;
