function [] = k_accuracy(M)

	m = rows(M);
	figure(1);
	plot(1,M(1,1));
	for i=2:m,
		line([i-1,i],[M(i-1,1),M(i,1)],'Color','b','linewidth',2);
		hold on;
	end;	
	title('Spiral Accuracy vs K');
	xlabel('k');
	ylabel('Accuracy');

end;

