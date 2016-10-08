function [] = a(tc1,tc2,tc3,tc4,tp1,tp2,tp3,tp4,N1,N2,N3,N4)

pre1 = tc1/tp1
pre2 = tc2/tp2
pre3 = tc3/tp3
pre4 = tc4/tp4
meanpre = (pre1+pre2+pre3+pre4)/4

rec1 = tc1/N1
rec2 = tc2/N2
rec3 = tc3/N3
rec4 = tc4/N4
meanrec = (rec1+rec2+rec3+rec4)/4

f1 = (2*rec1*pre1)/(rec1+pre1)
f2 = (2*rec2*pre2)/(rec2+pre2)
f3 = (2*rec3*pre3)/(rec3+pre3)
f4 = (2*rec4*pre4)/(rec4+pre4)
fmean = (f1 + f2 + f3 + f4)/4

acc = (tc1 + tc2 + tc3 + tc4)/(N1+N2+N3+N4)
end;