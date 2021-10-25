function [ output ] = yagerdefuzz( S,AGGRIGATE,alfa )
d1=0;
d2=0;
k=size(S);
for i=1:k(2)
d1=d1+(AGGRIGATE(i)^alfa)*S(i);
d2=d2+(AGGRIGATE(i)^alfa);   
end

output=d1/d2;
end

permutationsall(79937,:)