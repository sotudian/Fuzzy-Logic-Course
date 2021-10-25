%  Shahab Sotudian--94125091
disp('*** Standard complement for Gaussian membership function ***')
disp('assumption:  x belong to [0,10]')
disp('Enter the parameter of Gaussian membership function sigma and mean  ***')
sigma=input('Enter the amount of  sigma ');
c=input('Enter the amount of  mean ');

% Gaussian membership function
x=0:0.1:(c+4*sigma);
y = exp(-(x - c).^2/(2*sigma^2));

%Standard complement
u=1-y;

% plottingt
plot(x,y,'b','linewidth',3)
  hold on
plot(x,u,'c:','linewidth',3)
     axis([0 (c+4*sigma) 0  1.1]);
   legend('MF','Complement')
   xlabel('Gaussian Membership Function and standard complement')