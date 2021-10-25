clear
clc
%  Shahab Sotudian--94125091
% Gaussian  Number Operations
% Gaussian  Number A
sigma1=0.5;
mean1=5;

% Gaussian  Number B
sigma2=2;
mean2=7;

alfa=0;
y=[];
l = -5:0.1:15;

% alfa cut
A=[(mean1-sigma1*sqrt((-2)*log(alfa))),(mean1+sigma1*sqrt((-2)*log(alfa)))];
B=[(mean2-sigma2*sqrt((-2)*log(alfa))),(mean2+sigma2*sqrt((-2)*log(alfa)))];

% MIN  
for i=1:1:101
    alfa=(i-1)/100;
   y(i)=alfa;
s1(i)=min((mean1-sigma1*sqrt((-2)*log(alfa))),(mean2-sigma2*sqrt((-2)*log(alfa))));
s2(i)=min((mean1+sigma1*sqrt((-2)*log(alfa))),(mean2+sigma2*sqrt((-2)*log(alfa))));


end



    subplot(211)
h1=gaussmf(l,[0.5 5]);
plot(l,h1,'c','linewidth',1.5)
hold on
h2=gaussmf(l,[2 7]);
plot(l,h2,'r','linewidth',1.5)
title('A=[0.5,5] and B=[2,7]')
axis([-1,14,0,1])
legend('A','B')
    subplot(212)
plot(s1,y,'b-.','linewidth',2)
hold on
plot(s2,y,'b-.','linewidth',2)
axis([-1,14,0,1])
title('MIN  ')



