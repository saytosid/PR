function [dist] = DTW(X1 , X2)      % X1(ref seq) and X2(test seq) are vectors
									% Image X1 = 36x23

	[Tn , a] = size(X1);
	[Tm , a] = size(X2);
	distance = zeros(Tn,Tm);
	
	for i = 1:Tn,
		for j = 1:Tm,
			if ((i == 1) && (j == 1)),
				distance(1,1)  = sq_euc_dist(X1(1,:) , X2(1,:));
            end

			if ((i == 1) && (j > 1)),
				distance(i,j)  = distance(i,j-1) + sq_euc_dist(X1(i,:) , X2(j,:));
            end

			if ((i > 1) && (j == 1)),
				distance(i,j)  = distance(i-1,j) + sq_euc_dist(X1(i,:) , X2(j,:));
            end

			if ((i > 1) && (j > 1)),
				a = sq_euc_dist(X1(i,:) , X2(j,:));
				k = [distance(i,j-1) distance(i-1,j) distance(i-1,j-1)];
				distance(i,j) = min(k);
				distance(i,j) = distance(i,j) + a; 
            end				 

        end	
    end	
	dist = distance(Tn,Tm)/(Tm*Tn);

end	
