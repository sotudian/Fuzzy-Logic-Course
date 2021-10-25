%  Shahab Sotudian--94125091
disp('*** Sugeno class of complement for Gaussian membership function ***')
disp('Enter the parameter of Gaussian membership function sigma and mean  ***')
sigma=input('Enter the amount of  sigma ');
c=input('Enter the amount of  mean ');
lamda=input('Enter the amount of  lamda(lamda>-1) ');


% Gaussian membership function
x=0:0.1:(c+4*sigma);
y = exp(-(x - c).^2/(2*sigma^2));

%Sugeno class of complement
s=(1.-y);
h=(1+lamda.*y);
k=s./h;

% plottingt
plot(x,y,'g','linewidth',3)
  hold on
plot(x,k,'r:','linewidth',2)
     axis([0 (c+4*sigma) 0  1.1]);
   legend('MF','Complement')
   xlabel('Gaussian Membership Function and Sugeno class of complement')