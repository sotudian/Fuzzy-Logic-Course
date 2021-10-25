%  Shahab Sotudian--94125091
disp('*** Combination of Sugeno-Yager class of complement for Gaussian membership function ***')
disp('Enter the parameter of Gaussian membership function sigma and mean  ***')
sigma=2;
c=7;
% Gaussian membership function
x=0:0.1:(c+4*sigma);
y = exp(-(x - c).^2/(2*sigma^2));

%Combination of Sugeno-Yager class of complement

s=(y.^0.3);
h=(1.-s);
d=(1.-0.9.*s);
k=h./d;
f=k.^(1/0.3);



s=(y.^0.5);
h=(1.-s);
d=(1.+0.*s);
k=h./d;
m=k.^(1/0.5);

s=(y.^0.8);
h=(1.-s);
d=(1.+1.*s);
k=h./d;
n=k.^(1/0.8);


ss=(y.^1);
h=(1.-s);
d=(1.+5.*s);
k=h./d;
j=k.^(1/1);


s=(y.^1.5);
h=(1.-s);
d=(1.+9.*s);
k=h./d;
z=k.^(1/1.5);


s=(y.^2);
h=(1.-s);
d=(1.+15.*s);
k=h./d;
e=k.^(1/2);








% plottingt
plot(x,y,'g','linewidth',3)
  hold on
plot(x,f,'r--','linewidth',1.3)
     hold on
plot(x,m,'b--','linewidth',1.3)
hold on
plot(x,n,'c--','linewidth',1.3)
hold on
plot(x,j,'m--','linewidth',1.3)
hold on
plot(x,z,'y--','linewidth',1.3)
hold on
plot(x,e,'k--','linewidth',1.3)

xlabel('Gaussian Membership Function and Combination of Sugeno-Yager class of complement')
legend('MF','lamda=-0.9,w=0.3','lamda=0,w=0.5','lamda=1,w=0.8','lamda=5,w=1','lamda=9,w=1.5','lamda=15,w=2')