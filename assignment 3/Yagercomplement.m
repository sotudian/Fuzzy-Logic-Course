%  Shahab Sotudian--94125091
disp('*** Yager class of complement for Gaussian membership function ***')
disp('Enter the parameter of Gaussian membership function sigma and mean  ***')
sigma=input('Enter the amount of  sigma ');
c=input('Enter the amount of  mean ');
w=input('Enter the amount of  w (w>0)');


% Gaussian membership function
x=0:0.1:(c+4*sigma);
y = exp(-(x - c).^2/(2*sigma^2));

%Yager class of complement
s=(y.^w);
h=(1.-s);
k=(h.^(1/w));

% plottingt
plot(x,y,'r','linewidth',3)
  hold on
plot(x,k,'b:','linewidth',1.3)
     axis([0 (c+4*sigma) 0  1.1]);
   legend('MF','Complement')
   xlabel('Gaussian Membership Function and Yager class of complement')