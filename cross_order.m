% low level function for calculating an offspring
% given 2 parent in the Parents - agrument
% Parents is a matrix with 2 rows, each row
% represent the genocode of the parent

function [c1,c2]= cross_order(p1,p2)
% two parents P1,P2 
n=floor((size(p1,2)-1)/2);
cut1 = round(rand*(n-1)+0.5); %Generate random cut point U(1,n/2);
cut2 = round(rand*(size(p1,2)-cut1-2)+1+cut1); %Generate random cut point U(cut1+1,n-1);
pTemp1=p1(1:end);
pTemp2=p2(1:end);
c1=p1;
c2=p2;  
for i=[(cut1+1):cut2]
  pTemp1=strrep(pTemp1,p2(i),-1);
  pTemp2=strrep(pTemp2,p1(i),-1);
end
c1([1:cut1 (cut2+1):size(p1,2)])=p2(find(pTemp2>0));
c2([1:cut1 (cut2+1):size(p1,2)])=p1(find(pTemp1>0));




