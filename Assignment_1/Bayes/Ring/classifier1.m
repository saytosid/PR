function [tc1,tc2,tp1,tp2] = classifier1(X,Y)
   
   m1 = 0.75 * length(X);
   m2 = 0.75 * length(Y);
  
   X1 = X;
   Y1 = Y;

   X = X(1:m1,:);
   Y = Y(1:m2,:);
   
   sigma1 = cov(X);
   sigma2 = cov(Y);
   sigma = (sigma1 + sigma2)/2;
   sigma = pinv(sigma);
   sigma
   mean1 = (mean(X))';
   mean2 = (mean(Y))';

   tc1 = 0;
   tc2 = 0;
  
   tp1 = 0;
   tp2 = 0;

   Pc1 = log(m1/length(X1));
   Pc2 = log(m2/length(Y1));

   m1 = m1 + 1;
   m2 = m2 + 1;
  

   for i = m1:length(X1),
     x = [X1(i,1) ; X1(i,2)];   
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1 + Pc1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2 + Pc2;
     a = [g1 g2];
     a = max(a);
     if a == g1,
        p1=plot(x(1),x(2),'g','MarkerSize',10);
        
          hold on;
          ++tc1;
     end;     
     if a == g2,
        p2=plot(x(1),x(2),'b','MarkerSize',10);
        legend([p1,p2],'Class1','Class2');
          hold on;
          ++tp2;
      end;       
   end;

   for i = m2:length(Y1),
     x = [Y1(i,1) ; Y1(i,2)];
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1 + Pc1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2 + Pc2;     
     a = [g1 g2];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'g','MarkerSize',10);
          hold on;
          ++tp1;
     end;     
     if a == g2,
        plot(x(1),x(2),'b','MarkerSize',10);
          hold on;
          ++tc2;
      end;        
   end;

   
   tp1 += tc1;
   tp2 += tc2;
   %tp3 += tc3;
 
   disp(tc1)
   disp(tc2)
   disp(tp1)
   disp(tp2)
   %plotting region
   % pts = [-2:0.32:3;-1.5:0.2:1.5]';
   pts = [0 0];
   for i = -2:0.1:2,
    for j = -2:0.1:2,
      pts = [pts;i j];
    end;
   end;
   for i = 1:length(pts);
     x = [pts(i,1); pts(i,2)];
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1 + Pc1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2 + Pc2;
     
     a = [g1 g2];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'y.');
          hold on;
     end;     
     if a == g2,
        plot(x(1),x(2),'c.');
          hold on;
      end;        
   end;
   xlabel('x coordinate');
   ylabel('y coordinate');
   title('Classifier1_ring');
end   	
