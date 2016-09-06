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
  
   w12 = sigma * (mean1 - mean2);
   x12 = (mean1 + mean2)/2;

   tc1 = 0;
   tc2 = 0;
  
   tp1 = 0;
   tp2 = 0;

   for i = m1:length(X1),
     x = [X1(i,1) ; X1(i,2)];
     if (w12)'*(x-x12) > 0 ,      %1> 3>
          plot(x(1),x(2),'g');
          hold on;
          ++tc1;
     else
          plot(x(1),x(2),'m');
          hold on;
          ++tp2;
     end; 
   end;    

   for i = m2:length(Y1),
     y = [Y1(i,1) ; Y1(i,2)];
     if (w12)'*(y-x12) > 0 ,    %1> 3>
          plot(y(1),y(2),'g');
          hold on;
          ++tp1;
     else
          plot(y(1),y(2),'m');
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

   
   %w12'(1,1)*x12(1,1)/w12'(1,2)
   %w12'(1,2)*x12(2,1)/w12'(1,2)
   %w12'(1,1)/w12'(1,2)
   %w12
end   	
