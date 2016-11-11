function [] = k_accuracy(M)

	m = rows(M);
	figure(1);
	% axis([0,70,0,100]);
	plot(M(1,1),M(1,2));
	for i=2:m,
		line([M(i-1,1),M(i,1)],[M(i-1,2),M(i,2)],'Color','b','linewidth',4);
		hold on;
	end;	
	title('Image Accuracy vs K','FontSize',13);
	xlabel('K','FontSize',13);
	ylabel('Accuracy','FontSize',13);

end;

