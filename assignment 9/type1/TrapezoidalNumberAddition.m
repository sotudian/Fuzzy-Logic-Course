clear
clc
%  Shahab Sotudian--94125091
% Trapezoidal  Number Operations
% Trapezoidal fuzzy Number A
a1=1;
a2=5;
a3=9;
a4=12;
% Trapezoidal fuzzy Number B
b1=2;
b2=3;
b3=4;
b4=10;
alfa=0;
y=[];
l = -5:0.1:15;
% alfa cut
A=[((a2-a1)*alfa+a1),(-(a4-a3)*alfa+a4)];
B=[((b2-b1)*alfa+b1),(-(b4-b3)*alfa+b4)];

% Addition
for i=1:1:101
    alfa=(i-1)/100;
   y(i)=alfa;
s1(i)=((a2-a1)*alfa+a1)+((b2-b1)*alfa+b1);
s2(i)=(-(a4-a3)*alfa+a4)+(-(b4-b3)*alfa+b4);


end



       subplot(311)
h1=trapmf(l,[1 5 9 12]);
plot(l,h1,'b','linewidth',1.5)
title('Trapezoidal fuzzy Number A=[1 5 9 12]')
axis([0,14,0,1.1])
       subplot(312)
h2=trapmf(l,[2,3,4,10]);
plot(l,h2,'r','linewidth',1.5)
title('Trapezoidal fuzzy Number B=[2,3,4,10]')
axis([0,14,0,1.1])

      subplot(313)
plot(s1,y,'k','linewidth',2)
hold on
plot(s2,y,'k','linewidth',2)
hold on
s3=s1(101):0.1:s2(101);
p=ones([size(s3),1]);
plot(s3,p,'k','linewidth',2)
axis([0,24,0,1.1])
title('ADDITION    A+B=[3,8,13,22]')



