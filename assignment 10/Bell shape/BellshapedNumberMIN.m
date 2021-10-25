clear
clc
%  Shahab Sotudian--94125091
% Bell-shaped   Number Operations
% Bell-shaped   Number A
a1=1.5;
b1=3;
c1=6;

% Bell-shaped   Number B
a2=1;
b2=3;
c2=5;

alfa=0;
y=[];
l = -5:0.1:15;

% alfa cut
A=[(c1-a1*(((1/alfa)-1).^(0.5/b1))),(c1+a1*(((1/alfa)-1).^(0.5/b1)))];
B=[(c2-a2*(((1/alfa)-1).^(0.5/b2))),(c2+a2*(((1/alfa)-1).^(0.5/b2)))];

% MIN  
for i=1:1:101
    alfa=(i-1)/100;
   y(i)=alfa;
s1(i)=min((c1-a1*(((1/alfa)-1).^(0.5/b1))),(c2-a2*(((1/alfa)-1).^(0.5/b2))));
s2(i)=min((c1+a1*(((1/alfa)-1).^(0.5/b1))),(c2+a2*(((1/alfa)-1).^(0.5/b2))));


end



    subplot(211)
h1=gbellmf(l,[1.5 3 6]);
plot(l,h1,'b','linewidth',1.5)
hold on
h2=gbellmf(l,[1 3 5]);
plot(l,h2,'r-.','linewidth',1.5)
title('A=[1.5 3 6] and B=[1 3 5]')
axis([-1,22,0,1])
legend('A','B')
    subplot(212)
plot(s1,y,'b:','linewidth',2)
hold on
plot(s2,y,'b:','linewidth',2)
axis([-1,22,0,1])
title('MIN  ')



