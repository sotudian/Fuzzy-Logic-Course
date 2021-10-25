%  Shahab Sotudian--94125091
%  Drastic  S-Norm
clear
clc
z=[];
disp('*** Drastic S-Norm for Gaussian membership function ***')
disp('***Assumption: X belong to [0,100]  ***')
disp('Enter the parameter of first Gaussian membership function sigma and mean  ***')
sigma1=input('Enter the amount of  sigma ');
c1=input('Enter the amount of  mean ');
disp('Enter the parameter of second Gaussian membership function sigma and mean  ***')
sigma2=input('Enter the amount of  sigma ');
c2=input('Enter the amount of  mean ');

% 1st Gaussian membership function
x1=0:0.15:100;
y1 = exp(-(x1 - c1).^2/(2*sigma1^2));
% 2nd Gaussian membership function
x2=0:0.15:100;
y2 = exp(-(x2 - c2).^2/(2*sigma2^2));

ss=size(y1);
ss(2);
for e=1:ss(2)
if y1(e)<(exp(-((4*sigma1) - c1).^2/(2*sigma1^2)))
    y1(e)=0;
end
end
for e=1:ss(2)
if y2(e)<(exp(-((4*sigma2) - c2).^2/(2*sigma2^2)))
    y2(e)=0;
end
end


%  Drastic S-Norm
[Y1,Y2]=meshgrid(y1,y2);
[i,j]=size(Y1);
z = zeros(size(Y1));
for l=1:i
    for k=1:j
        if Y1(l,k)==0
           z(l,k)=Y2(l,k);
           
        elseif Y2(l,k)==0
           z(l,k)=Y1(l,k);
        else
      z(l,k)=1;
        end
  
    end
end


% plotting
mesh(Y1,Y2,z)
xlabel('a')
ylabel('b')
zlabel('S-Norm')
title('Drastic S-Norm for Gaussian MF ');
colormap parula

   