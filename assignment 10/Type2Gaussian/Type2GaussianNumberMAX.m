clear
clc
%  Shahab Sotudian--94125091
% Type II Gaussian  Number Operations
% Type II Gaussian  Number A
sigma1L=1;
mean1L=7.5;

sigma1U=1.3;
mean1U=7.5;

% Type II Gaussian  Number B
sigma2U=1;
mean2U=7;

sigma2L=0.5;
mean2L=7;

alfa=0;
y=[];
l = -5:0.1:15;

% alfa cut
AU=[(mean1U-sigma1U*sqrt((-2)*log(alfa))),(mean1U+sigma1U*sqrt((-2)*log(alfa)))];
BU=[(mean2U-sigma2U*sqrt((-2)*log(alfa))),(mean2U+sigma2U*sqrt((-2)*log(alfa)))];

AL=[(mean1L-sigma1L*sqrt((-2)*log(alfa))),(mean1L+sigma1L*sqrt((-2)*log(alfa)))];
BL=[(mean2L-sigma2L*sqrt((-2)*log(alfa))),(mean2L+sigma2L*sqrt((-2)*log(alfa)))];

% MAX     
for i=1:1:101
    alfa=(i-1)/100;
   y(i)=alfa;
s1U(i)=max((mean1U-sigma1U*sqrt((-2)*log(alfa))),(mean2U-sigma2U*sqrt((-2)*log(alfa))));
s2U(i)=max((mean1U+sigma1U*sqrt((-2)*log(alfa))),(mean2U+sigma2U*sqrt((-2)*log(alfa))));

s1L(i)=max((mean1L-sigma1L*sqrt((-2)*log(alfa))),(mean2L-sigma2L*sqrt((-2)*log(alfa))));
s2L(i)=max((mean1L+sigma1L*sqrt((-2)*log(alfa))),(mean2L+sigma2L*sqrt((-2)*log(alfa))));
end



 
  subplot(311)
h1=gaussmf(l,[1 7.5]);
plot(l,h1,'c','linewidth',1.5)
hold on
h2=gaussmf(l,[1.3 7.5]);
plot(l,h2,'c','linewidth',1.5)
title('Type II Gaussian fuzzy Number A')
axis([3,13,0,1.1])
X=[l,fliplr(l)];                
Y=[h2,fliplr(h1)];             
fill(X,Y,'c');  
       subplot(312)
h3=gaussmf(l,[1 7]);
plot(l,h3,'b','linewidth',1.5)
hold on
h4=gaussmf(l,[0.5 7]);
plot(l,h4,'b','linewidth',1.5)
title('Type II Gaussian fuzzy Number B')
axis([3,13,0,1.1])
X=[l,fliplr(l)];                
Y=[h4,fliplr(h3)];             
fill(X,Y,'b');

      subplot(313)
plot(s1L,y,'y','linewidth',2)
hold on
plot(s2L,y,'y','linewidth',2)
hold on
plot(s1U,y,'y','linewidth',2)
hold on
plot(s2U,y,'y','linewidth',2)
axis([3,13,0,1.1])
hold on

H1=area(s1U,y);
set(H1,'FaceColor','y');
H1=area(s1L,y);
set(H1,'FaceColor','w');
H2=area(s2U,y);
set(H2,'FaceColor','y');
H2=area(s2L,y);
set(H2,'FaceColor','w');

title('MAX     -------Type II Gaussian fuzzy Number')

