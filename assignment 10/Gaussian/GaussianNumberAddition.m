clear
clc
%  Shahab Sotudian--94125091
% Gaussian  Number Operations
% Gaussian  Number A
sigma1=0.00000000000000000000000001;
mean1=5;

% Gaussian  Number B
sigma2=2;
mean2=20;

alfa=0;
y=[];
l = -5:0.1:115;

% alfa cut
A=[(mean1-sigma1*sqrt((-2)*log(alfa))),(mean1+sigma1*sqrt((-2)*log(alfa)))];
B=[(mean2-sigma2*sqrt((-2)*log(alfa))),(mean2+sigma2*sqrt((-2)*log(alfa)))];

% Addition
for i=1:1:101
    alfa=(i-1)/100;
   y(i)=alfa;
s1(i)=(mean1-sigma1*sqrt((-2)*log(alfa)))+(mean2-sigma2*sqrt((-2)*log(alfa)));
s2(i)=(mean1+sigma1*sqrt((-2)*log(alfa)))+(mean2+sigma2*sqrt((-2)*log(alfa)));


end



    subplot(211)
h1=gaussmf(l,[sigma1 mean1]);
plot(l,h1,'b','linewidth',1.5)
hold on
h2=gaussmf(l,[sigma2 mean2]);
plot(l,h2,'r','linewidth',1.5)
title('A=[1,5] and B=[2,7]')
% axis([-1,22,0,1])
legend('A','B')
    subplot(212)
plot(s1,y,'k','linewidth',2)
hold on
plot(s2,y,'k','linewidth',2)
% axis([-1,22,0,1])
title('ADDITION')



