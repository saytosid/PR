function p = g(Pi,x_cr,Mean,Cov,k)
	p = 0;
	for o=1:k,
		p = p + Pi(o,1) * normal(x_cr , Mean(o,:) , Cov(:,:,o));
	
	end;
end;	
