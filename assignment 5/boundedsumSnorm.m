%  Shahab Sotudian--94125091
%  Bounded Sum S-Norm 
clear
clc
z=[];
disp('*** Bounded Sum S-Norm  for Gaussian membership function ***')
disp('***Assumption: X belong to [0,50]  ***')
disp('Enter the parameter of first Gaussian membership function sigma and mean  ***')
sigma1=input('Enter the amount of  sigma ');
c1=input('Enter the amount of  mean ');
disp('Enter the parameter of second Gaussian membership function sigma and mean  ***')
sigma2=input('Enter the amount of  sigma ');
c2=input('Enter the amount of  mean ');

% 1st Gaussian membership function
x1=0:0.1:50;
y1 = exp(-(x1 - c1).^2/(2*sigma1^2));
% 2nd Gaussian membership function
x2=0:0.1:50;
y2 = exp(-(x2 - c2).^2/(2*sigma2^2));

%  Bounded Sum S-Norm 
[Y1,Y2]=meshgrid(y1,y2);
s=(Y1)+(Y2);
z=min(1,s);

% plotting
mesh(Y1,Y2,z)
xlabel('a')
ylabel('b')
zlabel('S-Norm')
title('Bounded Sum S-Norm  for Gaussian MF ');
colormap summer

   