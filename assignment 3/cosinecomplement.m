%  Shahab Sotudian--94125091
disp('*** Cosine class of complement for Gaussian membership function ***')
disp('Enter the parameter of Gaussian membership function sigma and mean  ***')
sigma=input('Enter the amount of  sigma ');
c=input('Enter the amount of  mean ');

% Gaussian membership function
x=0:0.1:(c+4*sigma);
y = exp(-(x - c).^2/(2*sigma^2));

%Cosine class of complement
h=(3.1415).*(y);
s=0.5*(1+cos(h));
% plottingt
plot(x,y,'b','linewidth',3)
  hold on
plot(x,s,'c:','linewidth',1.5)
     axis([0 (c+4*sigma) 0  1.1]);
   legend('MF','Complement')
   xlabel('Gaussian Membership Function and Cosine class of complement')