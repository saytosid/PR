function [tc1,tc2,tp1,tp2] = classifier3(X,Y)
   
   m1 = 0.75 * length(X);
   m2 = 0.75 * length(Y);
 
   X1 = X;
   Y1 = Y;
   X = X(1:m1,:);
   Y = Y(1:m2,:);

   sigma1 = cov(X);
   sigma2 = cov(Y);
 
   det1 = det(sigma1);
   det2 = det(sigma2);

   sigma1 = pinv(sigma1);
   sigma2 = pinv(sigma2);

   mean1 = (mean(X))';                  % X is 1x2
   mean2 = (mean(Y))';                  % mean1 is 2x1

   m = length(X1) + length(Y1);

   Pc1 = log(m1/m);
   Pc2 = log(m2/m);
 
   tc1 = 0;
   tc2 = 0;
   tp1 = 0;
   tp2 = 0;
   figure(7); 

   m1 = m1 + 1;
   m2 = m2 + 1;

   for i = m1:length(X1),
     x = [X1(i,1)  X1(i,2)];        % x is 1x2
     x = x';
     g1 = (-1/2)*(x' * sigma1 * x - (2*(mean1)'*sigma1*x) + (mean1)'*sigma1*mean1) - log(det1)/2  + Pc1;
     g2 = (-1/2)*(x' * sigma2 * x - (2*(mean2)'*sigma2*x) + (mean2)'*sigma2*mean2) - log(det2)/2  + Pc2;
     
    a = [g1 g2];
    a = max(a);
     if a == g1,
        p1 = plot(x(1),x(2),'g');
          hold on;
          ++tc1;
     end;     
     if a == g2,
        plot(x(1),x(2),'b');
        
          hold on;
          ++tp2;
      end;             
   end; 

   for i = m2:length(Y1),
    x = [Y1(i,1)  Y1(i,2)];        % x is 1x2
     x = x';
     g1 = (-1/2)*(x' * sigma1 * x - (2*(mean1)'*sigma1*x) + (mean1)'*sigma1*mean1) - log(det1)/2  + Pc1;
     g2 = (-1/2)*(x' * sigma2 * x - (2*(mean2)'*sigma2*x) + (mean2)'*sigma2*mean2) - log(det2)/2  + Pc2;
     
     a = [g1 g2];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'g');
          hold on;
          ++tp1;
     end;     
     if a == g2,
        p2=plot(x(1),x(2),'b');

          hold on;
          ++tc2;
      end;                
   end;  

   tp1 += tc1;
   tp2 += tc2;
   
   disp(tc1);
   disp(tc2); 
   disp(tp1);
   disp(tp2);
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
     g1 = (-1/2)*(x' * sigma1 * x - (2*(mean1)'*sigma1*x) + (mean1)'*sigma1*mean1) - log(det1)/2  ;
     g2 = (-1/2)*(x' * sigma2 * x - (2*(mean2)'*sigma2*x) + (mean2)'*sigma2*mean2) - log(det2)/2  ;
     
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
   title('Classifier3 ring');
   legend([p1,p2],'Class1','Class2');
end;   

