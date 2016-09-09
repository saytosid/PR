function [tc1,tc2,tp1,tp2] = classifier2(X,Y)
   
   m1 = 0.75 * length(X);
   m2 = 0.75 * length(Y);
   
   X1 = X;
   Y1 = Y;

   X = X(1:m1,:);        %training data
   Y = Y(1:m2,:);

   A = [X;Y];
   sigma = cov(A);
   sigma = pinv(sigma);
   sigma
   mean1 = (mean(X))';
   mean2 = (mean(Y))';
  
   w12 = sigma * (mean1 - mean2);
   x12 = (mean1 + mean2)/2;
 
   tc1 = 0;
   tc2 = 0;
   
   tp1 = 0;
   tp2 = 0;
   
   for i = m1:length(X1),
     x = [X1(i,1) ; X1(i,2)];
     
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2;
     
     a = [g1 g2];
     a = max(a);
     if a == g1,
        p1=plot(x(1),x(2),'g');
          hold on;
          ++tc1;
     end;     
     if a == g2,
        p2=plot(x(1),x(2),'b');
        legend([p1 p2],'Class1','Class2');
          hold on;
          ++tp2;
      end;       
   end;

   for i = m2:length(Y1),
     x = [Y1(i,1) ; Y1(i,2)];
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2;
     
     a = [g1 g2];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'g');
          hold on;
          ++tp1;
     end;     
     if a == g2,
        plot(x(1),x(2),'b');
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

    pts = [0 0];
   for i = -2:0.1:3,
    for j = -1.5:0.1:1.5,
      pts = [pts;i j];
    end;
   end;
   for i = 1:length(pts);
     x = [pts(i,1); pts(i,2)];
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2;
     
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
   %w12'(1,1)*x12(1,1)/w12'(1,2)
   %w12'(1,2)*x12(2,1)/w12'(1,2)
   %w12'(1,1)/w12'(1,2)
   %w12
   xlabel('x coordinate');
   ylabel('y coordinate');
   title('Classifier2_interlock');
end   	
