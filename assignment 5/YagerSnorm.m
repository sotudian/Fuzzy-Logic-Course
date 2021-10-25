%  Shahab Sotudian--94125091
%  Yager S-Norm
clear
clc
z=[];
w=0;
disp('*** Yager S-Norm for Gaussian membership function ***')
disp('***Assumption: X belong to [0,50]  ***')
disp('Enter the parameter of first Gaussian membership function sigma and mean  ***')
sigma1=input('Enter the amount of  sigma ');
c1=input('Enter the amount of  mean ');
disp('Enter the parameter of second Gaussian membership function sigma and mean  ***')
sigma2=input('Enter the amount of  sigma ');
c2=input('Enter the amount of  mean ');
disp('Enter the parameter of Yager t-Norm -->   w (w>0) ***')
w=input('Enter the amount of  w ');

% 1st Gaussian membership function
x1=0:0.1:50;
y1 = exp(-(x1 - c1).^2/(2*sigma1^2));
% 2nd Gaussian membership function
x2=0:0.1:50;
y2 = exp(-(x2 - c2).^2/(2*sigma2^2));

%  Yager S-Norm
[Y1,Y2]=meshgrid(y1,y2);
[i,j]=size(Y1);
z = zeros(size(Y1));
for l=1:i
    for k=1:j
      z(l,k)=min(1,(((Y1(l,k))^w)+((Y2(l,k))^w))^(1/w));
  
    end
end


% plotting
mesh(Y1,Y2,z)
xlabel('a')
ylabel('b')
zlabel('s-Norm')
title('Yager S-Norm for Gaussian MF  ');
colormap autumn

   