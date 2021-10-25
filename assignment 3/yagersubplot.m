%  Shahab Sotudian--94125091
disp('*** Yager class of complement for Gaussian membership function ***')
disp('Enter the parameter of Gaussian membership function sigma and mean  ***')
sigma=2;
c=7;

% Gaussian membership function
x=0:0.1:(c+4*sigma);
y = exp(-(x - c).^2/(2*sigma^2));

%Yager class of complement

s=(y.^0.3);
h=(1.-s);
l=(h.^(1/0.3));

s=(y.^0.5);
h=(1.-s);
p=(h.^(1/0.5));

s=(y.^0.8);
h=(1.-s);
u=(h.^(1/0.8));

s=(y.^1);
h=(1.-s);
t=(h.^(1/1));

s=(y.^1.5);
h=(1.-s);
z=(h.^(1/1.5));

s=(y.^2);
h=(1.-s);
n=(h.^(1/2));


s=(y.^10);
h=(1.-s);
m=(h.^(1/10));
% plottingt
plot(x,y,'r','linewidth',3)
  hold on
plot(x,l,'c--','linewidth',1.3)
hold on
plot(x,p,'m--','linewidth',1.3)
hold on
plot(x,u,'y--','linewidth',1.3)
hold on
plot(x,t,'k--','linewidth',1.3)
hold on
plot(x,z,'r--','linewidth',1.3)
hold on
plot(x,n,'b--','linewidth',1.3)
hold on
plot(x,m,'m:','linewidth',1.3)
axis([0 (c+4*sigma) 0  1.1]);
xlabel('Gaussian Membership Function and Yager class of complement')
legend('MF','w=0.3','w=0.5','w=0.8','w=1','w=1.5','w=2','w=10')
