function [tc1,tc2,tp1,tp2] = classifier3(X,Y)
   
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
   
   sigma1(1,2) = 0;
   sigma1(2,1) = 0;
   
   sigma2(1,2) = 0;
   sigma2(2,1) = 0;

   %sigma3(1,2) = 0;
   %sigma3(2,1) = 0;
   
   det1 = det(sigma1);
   det2 = det(sigma2);
   %det3 = det(sigma3);

   sigma1 = pinv(sigma1);
   sigma2 = pinv(sigma2);
   %sigma3 = pinv(sigma3);	
   
    mean1 = (mean(X))';                  % X is 1x2
   mean2 = (mean(Y))';                  % mean1 is 2x1
   %mean3 = (mean(Z))';                  %done

   tc1 = 0;
   tc2 = 0;
   %tc3 = 0;
   tp1 = 0;
   tp2 = 0;
   %tp3 = 0;

   figure(7); 

   for i = m1:length(X1),
     x = [X1(i,1)  X1(i,2)];        % x is 1x2
     x = x';
     g1 = (-1/2)*(x' * sigma1 * x - (2*(mean1)'*sigma1*x) + (mean1)'*sigma1*mean1) - log(det1)/2  ;
     g2 = (-1/2)*(x' * sigma2 * x - (2*(mean2)'*sigma2*x) + (mean2)'*sigma2*mean2) - log(det2)/2  ;
     
     a = [g1 g2];
    a = max(a);
     if a == g1,
        plot(x(1),x(2),'g');
          hold on;
          ++tc1;
     end;     
     if a == g2,
        plot(x(1),x(2),'b');
          hold on;
          ++tp2;
      end;    
          
   end; 

   for i = m1:length(Y1),
    x = [Y1(i,1)  Y1(i,2)];        % x is 1x2
     x = x';
     g1 = (-1/2)*(x' * sigma1 * x - (2*(mean1)'*sigma1*x) + (mean1)'*sigma1*mean1) - log(det1)/2  ;
     g2 = (-1/2)*(x' * sigma2 * x - (2*(mean2)'*sigma2*x) + (mean2)'*sigma2*mean2) - log(det2)/2  ;
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

   disp(tc1);
   disp(tc2);
   %disp(tc3);
   disp(tp1);
   disp(tp2);
   %disp(tp3);
 
  
end   	
