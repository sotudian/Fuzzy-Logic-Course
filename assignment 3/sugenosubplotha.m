%  Shahab Sotudian--94125091
disp('*** Sugeno class of complement for Gaussian membership function ***')
disp('Enter the parameter of Gaussian membership function sigma and mean  ***')
sigma=2;
c=7;
% Gaussian membership function
x=0:0.1:(c+4*sigma);
y = exp(-(x - c).^2/(2*sigma^2));

%Sugeno class of complement

s=(1.-y);
h=(1-0.9.*y);
k=s./h;


s=(1.-y);
h=(1+0.*y);
l=s./h;

s=(1.-y);
h=(1+1.*y);
p=s./h;

s=(1.-y);
h=(1+3.*y);
u=s./h;

s=(1.-y);
h=(1+5.*y);
t=s./h;

s=(1.-y);
h=(1+9.*y);
z=s./h;

s=(1.-y);
h=(1+15.*y);
c=s./h;

s=(1.-y);
h=(1+25.*y);
v=s./h;

s=(1.-y);
h=(1+35.*y);
b=s./h;

s=(1.-y);
h=(1+50.*y);
n=s./h;

% plottingt
plot(x,y,'g','linewidth',3)
  hold on
plot(x,k,'r--','linewidth',1.3)
     hold on
plot(x,l,'b--','linewidth',1.3)
hold on
plot(x,u,'c--','linewidth',1.3)
hold on
plot(x,t,'m--','linewidth',1.3)
hold on
plot(x,z,'y--','linewidth',1.3)
hold on
plot(x,c,'k--','linewidth',1.3)
hold on
plot(x,v,'r:','linewidth',1.3)
hold on
plot(x,b,'b:','linewidth',1.3)
hold on
plot(x,n,'c:','linewidth',1.3)

xlabel('Gaussian Membership Function and Sugeno class of complement')
legend('MF','lamda=-0.9','lamda=0','lamda=1','lamda=3','lamda=5','lamda=9','lamda=15','lamda=25','lamda=35','lamda=50')
