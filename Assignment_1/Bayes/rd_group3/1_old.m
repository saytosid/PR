function [tc1,tc2,tc3,tp1,tp2,tp3] = classifier1(X,Y,Z)
   
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
   sigma = (sigma1 + sigma2 + sigma3)/3;
   sigma = pinv(sigma);
   sigma
   mean1 = (mean(X))';
   mean2 = (mean(Y))';  %2x1
   mean3 = (mean(Z))';	
   
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
   t31 = 0;
   t32 = 0;
   
   m = length(X1) + length(Y1) + length(Z1);

   Pc1 = log(m1/m);
   Pc2 = log(m2/m);
   Pc3 = log(m3/m);
   figure(1);

   m1 = m1 + 1;
   m2 = m2 + 1;
   m3 = m3 + 1;
  
   %plotting region
   % pts = [-2:0.32:3;-1.5:0.2:1.5]';
   pts = [0 0];
   for i = 0:50:2000,
    for j = 0:50:2500,
      pts = [pts;i j];
    end;
   end;
   for i = 1:length(pts);
     x = [pts(i,1); pts(i,2)];
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1 + Pc1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2 + Pc2;
     g3 = (sigma * mean3)' * x + (-1/2) * (sigma * mean3)' * mean3 + Pc3;
     a = [g1 g2 g3];
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
   end;

   for i = m1:length(X1),
     x = [X1(i,1) ; X1(i,2)];
     
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1 + Pc1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2 + Pc2;
     g3 = (sigma * mean3)' * x + (-1/2) * (sigma * mean3)' * mean3 + Pc3;
     a = [g1 g2 g3];
     a = max(a);
     if a == g1,
        p1=plot(x(1),x(2),'g','MarkerSize',10);
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
   end;

   for i = m2:length(Y1),
     x = [Y1(i,1) ; Y1(i,2)];
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1 + Pc1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2 + Pc2;
     g3 = (sigma * mean3)' * x + (-1/2) * (sigma * mean3)' * mean3 + Pc3;
     a = [g1 g2 g3];
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
   end;

   for i = m3:length(Z1),
     x = [Z1(i,1) ; Z1(i,2)];
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1 + Pc1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2 + Pc2;
     g3 = (sigma * mean3)' * x + (-1/2) * (sigma * mean3)' * mean3 + Pc3;
     a = [g1 g2 g3];
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
   end;     

   
   tp1 = tp1 + tc1;
   tp2 = tp2 + tc2;
   tp3 = tp3 + tc3;
   disp(tc1)
   disp(tc2)
   disp(tc3)
   disp(tp1)
   disp(tp2)
   disp(tp3)
   disp(t12)
   disp(t13)
   disp(t21)
   disp(t23)
   disp(t31)
   disp(t32)
   xlabel('x coordinate');
   ylabel('y coordinate');
   title('Classifier1 Real Data');
   legend([p1,p2,p3],'Class1','Class2','Class3');
end   	
