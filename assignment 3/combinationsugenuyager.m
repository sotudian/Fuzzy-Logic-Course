%  Shahab Sotudian--94125091
disp('*** Combination of Sugeno-Yager class of complement for Gaussian membership function ***')
disp('Enter the parameter of Gaussian membership function sigma and mean  ***')
sigma=input('Enter the amount of  sigma ');
c=input('Enter the amount of  mean ');
lamda=input('Enter the amount of  lamda(lamda>-1) ');
w=input('Enter the amount of  w (w>0)');

% Gaussian membership function
x=0:0.1:(c+4*sigma);
y = exp(-(x - c).^2/(2*sigma^2));

%Combination of Sugeno-Yager class of complement
s=(y.^w);
h=(1.-s);
d=(1.+lamda.*s);
k=h./d;
f=k.^(1/w);

% plottingt
plot(x,y,'g','linewidth',3)
  hold on
plot(x,k,'r:','linewidth',1.3)
     axis([0 (c+4*sigma) 0  1.1]);
   legend('MF','Complement')
   xlabel('Gaussian Membership Function and Combination of Sugeno-Yager class of complement')