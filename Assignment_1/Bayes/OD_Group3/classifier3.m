function [tc1,tc2,tc3,tp1,tp2,tp3] = classifier3(X,Y,Z,A)
   
   m1 = 0.75 * length(X);
   m2 = 0.75 * length(Y);
   m3 = 0.75 * length(Z);	
   m4 = 0.75 * length(A);	

   X1 = X;
   Y1 = Y;
   Z1 = Z;
   A1 = A;

   X = X(1:m1,:);
   Y = Y(1:m2,:);
   Z = Z(1:m3,:);
   A = A(1:m4,:);
   
   sigma1 = cov(X);
   sigma2 = cov(Y);
   sigma3 = cov(Z);
   sigma4 = cov(A);
   
   det1 = det(sigma1);
   det2 = det(sigma2);
   det3 = det(sigma3);
   det4 = det(sigma4);

   sigma1 = pinv(sigma1);
   sigma2 = pinv(sigma2);
   sigma3 = pinv(sigma3);
   sigma4 = pinv(sigma4);	
   
   mean1 = (mean(X))';                  % X is 1x2
   mean2 = (mean(Y))';                  % mean1 is 2x1
   mean3 = (mean(Z))';                  %done
   mean4 = (mean(A))';

   tc1 = 0;
   tc2 = 0;
   tc3 = 0;
   tc4 = 0;
   tp1 = 0;
   tp2 = 0;
   tp3 = 0;
   tp4 = 0;

   t12 = 0;
   t13 = 0;
   t14 = 0;
   t21 = 0;
   t23 = 0;
   t24 = 0;
   t31 = 0;
   t32 = 0;
   t34 = 0;
   t41 = 0;
   t42 = 0;
   t43 = 0;

   m1 = m1 + 1;
   m2 = m2 + 1;
   m3 = m3 + 1;
   m4 = m4 + 1;
   figure(7); 

   %plotting region
   % pts = [-2:0.32:3;-1.5:0.2:1.5]';
   pts = [0 0];
   for i = -10:0.4:15,
    for j = -10:0.4:15,
      pts = [pts;i j];
    end;
   end;
   for i = 1:length(pts);
     x = [pts(i,1); pts(i,2)];
     g1 = (-1/2)*(x' * sigma1 * x - (2*(mean1)'*sigma1*x) + (mean1)'*sigma1*mean1) - log(det1)/2  ;
     g2 = (-1/2)*(x' * sigma2 * x - (2*(mean2)'*sigma2*x) + (mean2)'*sigma2*mean2) - log(det2)/2  ;
     g3 = (-1/2)*(x' * sigma3 * x - (2*(mean3)'*sigma3*x) + (mean3)'*sigma3*mean3) - log(det3)/2  ;
     g4 = (-1/2)*(x' * sigma4 * x - (2*(mean4)'*sigma4*x) + (mean4)'*sigma4*mean4) - log(det4)/2  ;
     a = [g1 g2 g3 g4];
     a = max(a);
     if a == g1,
        p1=plot(x(1),x(2),'y');
          hold on;
          % ++tc1;
     end;     
     if a == g2,
        plot(x(1),x(2),'c');
          hold on;
          % ++tp2;
      end;    
      if a == g3,
        plot(x(1),x(2),'r');
          hold on;
          % ++tp3;
     end;
       if a == g4,
        plot(x(1),x(2),'b');
          hold on;
          % ++tp4;
     end;      
   end;

   for i = m1:length(X1),
     x = [X1(i,1)  X1(i,2)];        % x is 1x2
     x = x';
     g1 = (-1/2)*(x' * sigma1 * x - (2*(mean1)'*sigma1*x) + (mean1)'*sigma1*mean1) - log(det1)/2  ;
     g2 = (-1/2)*(x' * sigma2 * x - (2*(mean2)'*sigma2*x) + (mean2)'*sigma2*mean2) - log(det2)/2  ;
     g3 = (-1/2)*(x' * sigma3 * x - (2*(mean3)'*sigma3*x) + (mean3)'*sigma3*mean3) - log(det3)/2  ;
     g4 = (-1/2)*(x' * sigma4 * x - (2*(mean4)'*sigma4*x) + (mean4)'*sigma4*mean4) - log(det4)/2  ;
     a = [g1 g2 g3 g4];
    a = max(a);
     if a == g1,
        plot(x(1),x(2),'g','MarkerSize',10);
          hold on;
          ++tc1;
     end;     
     if a == g2,
        plot(x(1),x(2),'b','MarkerSize',10);
          hold on;
          ++tp2;
	  ++t12;
      end;    
      if a == g3,
        plot(x(1),x(2),'m','MarkerSize',10);
          hold on;
          ++tp3;
	  ++t13;
     end;
      if a == g4,
        plot(x(1),x(2),'c','MarkerSize',10);
          hold on;
          ++tp4;
	  ++t14;
     end;     
   end; 

   for i = m2:length(Y1),
    x = [Y1(i,1)  Y1(i,2)];        % x is 1x2
     x = x';
     g1 = (-1/2)*(x' * sigma1 * x - (2*(mean1)'*sigma1*x) + (mean1)'*sigma1*mean1)- log(det1)/2  ;
     g2 = (-1/2)*(x' * sigma2 * x - (2*(mean2)'*sigma2*x) + (mean2)'*sigma2*mean2)- log(det2)/2  ;
     g3 = (-1/2)*(x' * sigma3 * x - (2*(mean3)'*sigma3*x) + (mean3)'*sigma3*mean3)- log(det3)/2  ;
     g4 = (-1/2)*(x' * sigma4 * x - (2*(mean4)'*sigma4*x) + (mean4)'*sigma4*mean4)- log(det4)/2  ;
     a = [g1 g2 g3 g4];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'g','MarkerSize',10);
          hold on;
          ++tp1;
          ++t21;
     end;     
     if a == g2,
        p2=plot(x(1),x(2),'b','MarkerSize',10);
          hold on;
          ++tc2;
      end;    
      if a == g3,
        plot(x(1),x(2),'m','MarkerSize',10);
          hold on;
          ++tp3;
	  ++t23;
     end;
       if a == g4,
        plot(x(1),x(2),'c','MarkerSize',10);
          hold on;
          ++tp4;
	  ++t24;
     end;        
   end;  

   for i = m3:length(Z1),
     x = [Z1(i,1)  Z1(i,2)];        % x is 1x2
     x = x';
     g1 = (-1/2)*(x' * sigma1 * x - (2*(mean1)'*sigma1*x) + (mean1)'*sigma1*mean1)- log(det1)/2  ;
     g2 = (-1/2)*(x' * sigma2 * x - (2*(mean2)'*sigma2*x) + (mean2)'*sigma2*mean2)- log(det2)/2  ;
     g3 = (-1/2)*(x' * sigma3 * x - (2*(mean3)'*sigma3*x) + (mean3)'*sigma3*mean3)- log(det3)/2  ;
     g4 = (-1/2)*(x' * sigma4 * x - (2*(mean4)'*sigma4*x) + (mean4)'*sigma4*mean4)- log(det4)/2  ;
     a = [g1 g2 g3 g4];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'g','MarkerSize',10);
          hold on;
          ++tp1;
	  ++t31;
     end;     
     if a == g2,
        plot(x(1),x(2),'b','MarkerSize',10);
          hold on;
          ++tp2;
	  ++t32;
      end;    
      if a == g3,
        p3=plot(x(1),x(2),'m','MarkerSize',10);
          hold on;
          ++tc3;
     end; 
      if a == g4,
        plot(x(1),x(2),'c','MarkerSize',10);
          hold on;
          ++tp4;
	  ++t34;
     end;      
   end;

    for i = m4:length(A1),
     x = [A1(i,1)  A1(i,2)];        % x is 1x2
     x = x';
     g1 = (-1/2)*(x' * sigma1 * x - (2*(mean1)'*sigma1*x) + (mean1)'*sigma1*mean1)- log(det1)/2  ;
     g2 = (-1/2)*(x' * sigma2 * x - (2*(mean2)'*sigma2*x) + (mean2)'*sigma2*mean2)- log(det2)/2  ;
     g3 = (-1/2)*(x' * sigma3 * x - (2*(mean3)'*sigma3*x) + (mean3)'*sigma3*mean3)- log(det3)/2  ;
     g4 = (-1/2)*(x' * sigma4 * x - (2*(mean4)'*sigma4*x) + (mean4)'*sigma4*mean4)- log(det4)/2  ;
     a = [g1 g2 g3 g4];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'g','MarkerSize',10);
          hold on;
          ++tp1;
          ++t41;
     end;     
     if a == g2,
        plot(x(1),x(2),'b','MarkerSize',10);
          hold on;
          ++tp2;
	  ++t42;
      end;    
      if a == g3,
        plot(x(1),x(2),'m','MarkerSize',10);
          hold on;
          ++tp3;
          ++t43;
     end; 
      if a == g4,
        p4=plot(x(1),x(2),'c','MarkerSize',10);
          hold on;
          ++tc4;
     end;      
   end;
   
   tp1 += tc1;
   tp2 += tc2;
   tp3 += tc3; 
   tp4 += tc4; 

   disp(tc1);
   disp(tc2);
   disp(tc3);
   disp(tc4);
   disp(tp1);
   disp(tp2);
   disp(tp3);
   disp(tp4); 

   disp(t12)
   disp(t13)
   disp(t14)
   disp(t21)
   disp(t23)
   disp(t24)
   disp(t31)
   disp(t32)
   disp(t34)
   disp(t41)
   disp(t42)
   disp(t43)

   xlabel('x coordinate');
   ylabel('y coordinate');
   title('Classifier3 OD');
   legend([p1,p2,p3,p4],'Class1','Class2','Class3','Class4');

end   	
