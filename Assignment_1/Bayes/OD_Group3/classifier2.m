function [tc1,tc2,tc3,tc4,tp1,tp2,tp3,tp4] = classifier2(X,Y,Z,W)
   
   m1 = 0.75 * length(X);
   m2 = 0.75 * length(Y);
   m3 = 0.75 * length(Z);
   m4 = 0.75 * length(W);	
   
   X1 = X;
   Y1 = Y;
   Z1 = Z;
   W1 = W;

   X = X(1:m1,:);        %training data
   Y = Y(1:m2,:);
   Z = Z(1:m3,:);
   W = W(1:m4,:);
   A = [X;Y;Z;W];
   sigma = cov(A);
   sigma = pinv(sigma);
   sigma
   mean1 = (mean(X))';
   mean2 = (mean(Y))';
   mean3 = (mean(Z))';
   mean4 = (mean(W))';
   
   tc1 = 0;
   tc2 = 0;
   tc3 = 0;
   tc4 = 0;
   tp1 = 0;
   tp2 = 0;
   tp3 = 0;
   tp4 = 0;

   m1 = m1 + 1;
   m2 = m2 + 1;
   m3 = m3 + 1;
   m4 = m4 + 1;
   figure(1);

  for i = m1:length(X1),
     x = [X1(i,1) ; X1(i,2)];     
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2;
     g3 = (sigma * mean3)' * x + (-1/2) * (sigma * mean3)' * mean3;
     g4 = (sigma * mean4)' * x + (-1/2) * (sigma * mean4)' * mean4;
     a = [g1 g2 g3 g4];
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
      if a == g3,
        plot(x(1),x(2),'m');
          hold on;
          ++tp3;
     end;
       if a == g4,
        plot(x(1),x(2),'c');
          hold on;
          ++tp4;
     end;     
   end;

   for i = m2:length(Y1),
     x = [Y1(i,1) ; Y1(i,2)];
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2;
     g3 = (sigma * mean3)' * x + (-1/2) * (sigma * mean3)' * mean3;
     g4 = (sigma * mean4)' * x + (-1/2) * (sigma * mean4)' * mean4;
     a = [g1 g2 g3 g4];
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
      if a == g3,
        plot(x(1),x(2),'m');
          hold on;
          ++tp3;
     end;
       if a == g4,
        plot(x(1),x(2),'c');
          hold on;
          ++tp4;
     end;     
   end;

   for i = m3:length(Z1),
     x = [Z1(i,1) ; Z1(i,2)];
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2;
     g3 = (sigma * mean3)' * x + (-1/2) * (sigma * mean3)' * mean3;
     g4 = (sigma * mean4)' * x + (-1/2) * (sigma * mean4)' * mean4;
     a = [g1 g2 g3 g4];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'g');
          hold on;
          ++tp1;
     end;     
     if a == g2,
        plot(x(1),x(2),'b');
          hold on;
          ++tp2;
      end;    
      if a == g3,
        plot(x(1),x(2),'m');
          hold on;
          ++tc3;
     end;
       if a == g4,
        plot(x(1),x(2),'c');
          hold on;
          ++tp4;
     end;       
   end;

   for i = m4:length(W1),
     x = [W1(i,1) ; W1(i,2)];
     g1 = (sigma * mean1)' * x + (-1/2) * (sigma * mean1)' * mean1;
     g2 = (sigma * mean2)' * x + (-1/2) * (sigma * mean2)' * mean2;
     g3 = (sigma * mean3)' * x + (-1/2) * (sigma * mean3)' * mean3;
     g4 = (sigma * mean4)' * x + (-1/2) * (sigma * mean4)' * mean4;
     a = [g1 g2 g3 g4];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'g');
          hold on;
          ++tp1;
     end;     
     if a == g2,
        plot(x(1),x(2),'b');
          hold on;
          ++tp2;
      end;    
      if a == g3,
        plot(x(1),x(2),'m');
          hold on;
          ++tp3;
     end;
       if a == g4,
        plot(x(1),x(2),'c');
          hold on;
          ++tc4;
     end;       
   end;     

   
   tp1 = tp1 + tc1;
   tp2 = tp2 + tc2;
   tp3 = tp3 + tc3;
   tp4 = tp4 + tc4;
   
   disp(tc1)
   disp(tc2)
   disp(tc3)
   disp(tc4)
   disp(tp1)
   disp(tp2)
   disp(tp3)  
   disp(tp4)
end  
