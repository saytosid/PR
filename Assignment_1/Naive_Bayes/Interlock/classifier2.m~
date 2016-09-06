function [tc1,tc2,tp1,tp2] = classifier2(X,Y)
   
   m1 = 0.75 * length(X);
   m2 = 0.75 * length(Y);
   %m3 = 0.75 * length(Z);	
   
   X1 = X;
   Y1 = Y;
   %Z1 = Z;

   X = X(1:m1,:);
   Y = Y(1:m2,:);
   %Z = Z(1:m3,:);
   
   sigma1 = cov(X);
   sigma2 = cov(Y);
   %sigma3 = cov(Z);
   sigma = (sigma1 + sigma2)/2;
   sigma(1,2) = 0;
   sigma(2,1) = 0;
   sigma = pinv(sigma);
   mean1 = (mean(X))';
   mean2 = (mean(Y))';
   %mean3 = (mean(Z))';
  
   w12 = sigma * (mean1 - mean2);
   x12 = (mean1 + mean2)/2;

   %w23 = sigma * (mean2 - mean3);
   %x23 = (mean2 + mean3)/2;

   %w13 = sigma * (mean1 - mean3);
   %x13 = (mean1 + mean3)/2;	
   
   tc1 = 0;
   tc2 = 0;
   %tc3 = 0;
   tp1 = 0;
   tp2 = 0;
   %tp3 = 0;
   %figure(1);

   for i = m1:length(X1),
     x = [X1(i,1) ; X1(i,2)];
     if (w12)'*(x-x12) > 0 ,
          plot(x(1),x(2),'g.');       %1> 3< 
          hold on;
          tc1 = tc1 + 1;
     else
          plot(x(1),x(2),'b.');
          hold on;
          tp2 = tp2 + 1;
     end; 
   end;    

   for i = m2:length(Y1),
     y = [Y1(i,1) ; Y1(i,2)];
     if (w12)'*(y-x12) > 0 ,
          plot(y(1),y(2),'g.');       %1> 3< 
          hold on;
          tp1 = tp1 + 1;
     else
          plot(y(1),y(2),'b.');
          hold on;
          tc2 = tc2 + 1;
     end; 
   end; 

   tp1 = tp1 + tc1;
   tp2 = tp2 + tc2;
   %tp3 += tc3;

   disp(tc1)
   disp(tc2)
   disp(tp1)
   disp(tp2)

end   	
