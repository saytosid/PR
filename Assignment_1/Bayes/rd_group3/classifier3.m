function [tc1,tc2,tc3,tp1,tp2,tp3] = classifier3(X,Y,Z)
   
   m1 = 0.75 * length(X);
   m2 = 0.75 * length(Y);
   m3 = 0.75 * length(Z);	

  m1 = floor(m1);
   m2 = floor(m2);	
   m3 = floor(m3);
   
   X1 = X;
   Y1 = Y;
   Z1 = Z;

   X = X(1:m1,:);
   Y = Y(1:m2,:);
   Z = Z(1:m3,:);
   
   sigma1 = cov(X);
   sigma2 = cov(Y);
   sigma3 = cov(Z);
   
   det1 = det(sigma1);
   det2 = det(sigma2);
   det3 = det(sigma3);

   sigma1 = pinv(sigma1);
   sigma2 = pinv(sigma2);
   sigma3 = pinv(sigma3);	
   
   mean1 = (mean(X))';                  % X is 1x2
   mean2 = (mean(Y))';                  % mean1 is 2x1
   mean3 = (mean(Z))';                  %done
  
   W12 = sigma1 - sigma2;              % 2x2
   W13 = sigma1 - sigma3;
   W23 = sigma2 - sigma3;

   w12 = sigma1*mean1 - sigma2*mean2;  %w12 is 1x2
   w13 = sigma1*mean1 - sigma3*mean3;
   w23 = sigma2*mean2 - sigma3*mean3;
 
   w012 = -1/2*((mean1' * sigma1 * mean1) + (mean2' * sigma2 * mean2) - log(det1/det2));
   w013 = -1/2*((mean1' * sigma1 * mean1) + (mean3' * sigma3 * mean3) - log(det1/det3));
   w023 = -1/2*((mean2' * sigma2 * mean2) + (mean3' * sigma3 * mean3) - log(det2/det3));

   tc1 = 0;
   tc2 = 0;
   tc3 = 0;
   tp1 = 0;
   tp2 = 0;
   tp3 = 0;

   for i = m1:length(X1),
     x = [X1(i,1)  X1(i,2)];        % x is 1x2
     x = x';
     if (g(W12,w12,w012,x)) > 0 ,
        if (g(W13,w13,w013,x)) > 0,      %1> 3>
          plot(x(1),x(2),'g');
          hold on;
          ++tc1;
        else,
          plot(x(1),x(2),'m');       %1> 3< 
          hold on;
          ++tp3;
        end;
     else
         if (g(W23,w23,w023,x)) > 0,       %1< 3>
          plot(x(1),x(2),'b');
          hold on;
          ++tp2;
        else,
          plot(x(1),x(2),'m');
          hold on;
          ++tp3;
        end;
     end; 
   end;    

   for i = m1:length(Y1),
     x = [Y1(i,1)  Y1(i,2)];        % x is 1x2
     x = x';
     if (g(W12,w12,w012,x)) > 0 ,
        if (g(W13,w13,w013,x)) > 0,      %1> 3>
          plot(x(1),x(2),'g');
          hold on;
          ++tp1;
        else,
          plot(x(1),x(2),'m');       %1> 3< 
          hold on;
          ++tp3;
        end;
     else
        if (g(W23,w23,w023,x)) > 0,       %1< 3>
          plot(x(1),x(2),'b');
          hold on;
          ++tc2;
        else,
          plot(x(1),x(2),'m');
          hold on;
          ++tp3;
        end;
     end; 
   end;

   for i = m3:length(Z1),
     x = [Z1(i,1)  Z1(i,2)];
     x = x';
     if (g(W12,w12,w012,x)) > 0 ,
        if (g(W13,w13,w013,x)) > 0,      %1> 3>
          plot(x(1),x(2),'g');
          hold on;
          ++tp1;
        else,
          plot(x(1),x(2),'m');       %1> 3< 
          hold on;
          ++tc3;
        end;
     else
        if (g(W23,w23,w023,x)) > 0,       %1< 3>
          plot(x(1),x(2),'b');
          hold on;
          ++tp2;
        else,
          plot(x(1),x(2),'m');
          hold on;
          ++tc3;
        end;
     end; 
   end;
   
   tp1 += tc1;
   tp2 += tc2;
   tp3 += tc3;
 
   disp(tc1);
   %disp(tp1);
   disp(tc2);
   disp(tc3); 
   
end   	
