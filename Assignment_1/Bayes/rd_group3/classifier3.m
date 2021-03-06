function [tc1,tc2,tc3,tp1,tp2,tp3] = classifier3(X,Y,Z)
   
   m1 = 0.75 * length(X);
   m2 = 0.75 * length(Y);
   m3 = 0.75 * length(Z);	
   m = m1+m2+m3;

   Pc1 = log(m1/m);
   Pc2 = log(m2/m);
   Pc3 = log(m3/m);

   X1 = X;
   Y1 = Y;
   Z1 = Z;

   X = X(1:m1,:);
   Y = Y(1:m2,:);
   Z = Z(1:m3,:);
   
   sigma1 = cov(X);
   sigma2 = cov(Y);
   sigma3 = cov(Z);
   
   mean1 = (mean(X))';
   mean2 = (mean(Y))';  %2x1
   mean3 = (mean(Z))';                %done
   
    
   tc1 = 0;
   tc2 = 0;
   tc3 = 0;
   tp1 = 0;
   tp2 = 0;
   tp3 = 0;
   

   m1 = m1 + 1;
   m2 = m2 + 1;
   m3 = m3 + 1;

   % plotting region
   figure(1);
   pts = [0 0];
   for i = 0:50:2500,
    for j = 0:50:2500,
      pts = [pts;i j];
    end;
   end;
   for i = 1:length(pts);
     x = [pts(i,1); pts(i,2)];
     g1 = g(x(1),x(2),mean1,sigma1,Pc1);
     g2 = g(x(1),x(2),mean2,sigma2,Pc2);
     g3 = g(x(1),x(2),mean3,sigma3,Pc3);
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
        plot(x(1),x(2),'Color',[0,0.5,0.3]);
          hold on;
          % ++tp3;
     end;     
   end;
   %training data
   for i = 1:m1,
      x = [X1(i,1)  X1(i,2)];
      x = x';
      p1=plot(x(1),x(2),'MarkerSize',9,'g');
      hold on;
    end;
   for i = 1:m2,
      x = [Y1(i,1)  Y1(i,2)];
      x = x';
      p2=plot(x(1),x(2),'MarkerSize',9,'b');
      hold on;
    end;   
    for i = 1:m3,
      x = [Z1(i,1)  Z1(i,2)];
      x = x';
      p3=plot(x(1),x(2),'MarkerSize',9,'m');
      hold on;
    end;    

   %  % testing data
   % for i = m1:length(X1),
   %   x = [X1(i,1)  X1(i,2)];        % x is 1x2
   %   x = x';
   %   g1 = g(x(1),x(2),mean1,sigma1,Pc1);
   %   g2 = g(x(1),x(2),mean2,sigma2,Pc2);
   %   g3 = g(x(1),x(2),mean3,sigma3,Pc3);
   %   a = [g1 g2 g3];
   %  a = max(a);
   %   if a == g1,
   %      % p1=plot(x(1),x(2),'g');
   %        hold on;
   %        ++tc1;
   %   end;     
   %   if a == g2,
   %      % plot(x(1),x(2),'b');
   %        hold on;
   %        ++tp2;
   %    end;    
   %    if a == g3,
   %      % plot(x(1),x(2),'m');
   %        hold on;
   %        ++tp3;
   %   end;     
   % end; 

   % for i = m2:length(Y1),
   %  x = [Y1(i,1)  Y1(i,2)];        % x is 1x2
   %   x = x';
   %   g1 = g(x(1),x(2),mean1,sigma1,Pc1);
   %   g2 = g(x(1),x(2),mean2,sigma2,Pc2);
   %   g3 = g(x(1),x(2),mean3,sigma3,Pc3);
   %   a = [g1 g2 g3];
   %   a = max(a);
   %   if a == g1,
   %      % plot(x(1),x(2),'g');
   %        hold on;
   %        ++tp1;
   %   end;     
   %   if a == g2,
   %      % p2=plot(x(1),x(2),'b');
   %        hold on;
   %        ++tc2;
   %    end;    
   %    if a == g3,
   %      % plot(x(1),x(2),'m');
   %        hold on;
   %        ++tp3;
   %   end;       
   % end;  

   % for i = m3:length(Z1),
   %   x = [Z1(i,1)  Z1(i,2)];        % x is 1x2
   %   x = x';
   %   g1 = g(x(1),x(2),mean1,sigma1,Pc1);
   %   g2 = g(x(1),x(2),mean2,sigma2,Pc2);
   %   g3 = g(x(1),x(2),mean3,sigma3,Pc3);
   %   a = [g1 g2 g3];
   %   a = max(a);
   %   if a == g1,
   %      % plot(x(1),x(2),'g');
   %        hold on;
   %        ++tp1;
   %   end;     
   %   if a == g2,
   %      % plot(x(1),x(2),'b');
   %        hold on;
   %        ++tp2;
   %    end;    
   %    if a == g3,
   %      % p3=plot(x(1),x(2),'m');
   %        hold on;
   %        ++tc3;
   %   end;      
   % end;
   
   % tp1 += tc1;
   % tp2 += tc2;
   % tp3 += tc3; 

   % disp(tc1);
   % disp(tc2);
   % disp(tc3);
   % disp(tp1);
   % disp(tp2);
   % disp(tp3);
   xlabel('x coordinate');
   ylabel('y coordinate');
   title('Classifier3 RD Bayes');
   legend([p1,p2,p3],'Class1','Class2','Class3');
   print -djpg 31.jpg;
   hold off;

   %plotting region C1,C2
   figure(2);
   for i = 1:length(pts);
     x = [pts(i,1); pts(i,2)];
     g1 = g(x(1),x(2),mean1,sigma1,Pc1);
     g2 = g(x(1),x(2),mean2,sigma2,Pc2);
     % g3 = g(x(1),x(2),mean3,sigma3,0);
     a = [g1 g2];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'y');
          hold on;
          % ++tc1;
     end;     
     if a == g2,
        plot(x(1),x(2),'c');
          hold on;
          % ++tp2;
      end;    
     %  if a == g3,
     %    plot(x(1),x(2),'Color',[0,0.5,0.3]);
     %      hold on;
     %      % ++tp3;
     % end;     
   end;
   %next 2 loops plot points of C1 and C2
   for i = 1:m1,
      x = [X1(i,1)  X1(i,2)];
      x = x';
      p1=plot(x(1),x(2),'g');
      hold on;
    end;
   for i = 1:m2,
      x = [Y1(i,1)  Y1(i,2)];
      x = x';
      p2=plot(x(1),x(2),'b');
      hold on;
    end;   
   xlabel('x coordinate');
   ylabel('y coordinate');
   title('Classifier3 RD Bayes C1,C2');
   legend([p1,p2],'Class1','Class2');
   print -djpg 32.jpg;
   hold off;

   %plotting region C2,C3
   figure(3);
   for i = 1:length(pts);
     x = [pts(i,1); pts(i,2)];
     % g1 = g(x(1),x(2),mean1,sigma1,0);
     g2 = g(x(1),x(2),mean2,sigma2,Pc2);
     g3 = g(x(1),x(2),mean3,sigma3,Pc3);
     a = [g3 g2];
     a = max(a);
     % if a == g1,
     %    plot(x(1),x(2),'y');
     %      hold on;
     %      % ++tc1;
     % end;     
     if a == g2,
        plot(x(1),x(2),'MarkerSize',9,'c');
          hold on;
          % ++tp2;
      end;    
      if a == g3,
        plot(x(1),x(2),'MarkerSize',9,'Color',[0,0.5,0.3]);
          hold on;
          % ++tp3;
     end;     
   end;
   %next 2 loops plot points of C2 and C3
   for i = 1:m3,
      x = [Z1(i,1)  Z1(i,2)];
      x = x';
      p1=plot(x(1),x(2),'m');
      hold on;
    end;
   for i = 1:m2,
      x = [Y1(i,1)  Y1(i,2)];
      x = x';
      p2=plot(x(1),x(2),'b');
      hold on;
    end;   
   xlabel('x coordinate');
   ylabel('y coordinate');
   title('Classifier3 RD Bayes C2,C3');
   legend([p1,p2],'Class3','Class2');
   print -djpg 33.jpg;
   hold off;
   
      %plotting region C1,C3
   figure(4);
   for i = 1:length(pts);
     x = [pts(i,1); pts(i,2)];
     g1 = g(x(1),x(2),mean1,sigma1,Pc1);
     % g2 = g(x(1),x(2),mean2,sigma2,0);
     g3 = g(x(1),x(2),mean3,sigma3,Pc3);
     a = [g3 g1];
     a = max(a);
     if a == g1,
        plot(x(1),x(2),'y');
          hold on;
          % ++tc1;
     end;     
     % if a == g2,
     %    plot(x(1),x(2),'c');
     %      hold on;
     %      % ++tp2;
     %  end;    
      if a == g3,
        plot(x(1),x(2),'Color',[0,0.5,0.3]);
          hold on;
          % ++tp3;
     end;     
   end;
   %next 2 loops plot points of C1and C3
   for i = 1:m3,
      x = [Z1(i,1)  Z1(i,2)];
      x = x';
      p1=plot(x(1),x(2),'MarkerSize',9,'m');
      hold on;
    end;
   for i = 1:m1,
      x = [X1(i,1)  X1(i,2)];
      x = x';
      p2=plot(x(1),x(2),'MarkerSize',9,'g');
      hold on;
    end;   
   xlabel('x coordinate');
   ylabel('y coordinate');
   title('Classifier3 RD Bayes C1,C3');
   legend([p1,p2],'Class3','Class1');
   print -djpg 34.jpg;
   hold off;

   figure(5);
   %Next three for loops plot the training
   for i = 1:m1,
      x = [X1(i,1)  X1(i,2)];
      x = x';
      p1=plot(x(1),x(2),'g');
      hold on;
    end;
   for i = 1:m2,
      x = [Y1(i,1)  Y1(i,2)];
      x = x';
      p2=plot(x(1),x(2),'b');
      hold on;
    end;    
        

   for i = 1:m3,
     x = [Z1(i,1)  Z1(i,2)];        % x is 1x2
     x = x';
      p3=plot(x(1),x(2),'m');
     hold on;
      end; 

   hold on;
   [x,y]=meshgrid(-0:50:2000,0:50:2500);
   i_max = size(x)(1,1);
   j_max = size(y)(1,2);
   for i = 1:1:i_max,
    for j = 1:1:j_max,
      z1(i,j)=g(x(i,j),y(i,j),mean1,sigma1,Pc1);
      z2(i,j)=g(x(i,j),y(i,j),mean2,sigma2,Pc2);
      z3(i,j)=g(x(i,j),y(i,j),mean3,sigma3,Pc3);
      z(i,j)=max(z1(i,j),max(z2(i,j),z3(i,j)));
    end;
   end;
   contour(x,y,z,50);
   hold on;
   xlabel('x coordinate');
   ylabel('y coordinate');
   title('Classifier3 RD Bayes Contour plot');
   legend([p1,p2,p3],'Class1','Class2','Class3');   
   print -djpg 35.jpg;

end;   


