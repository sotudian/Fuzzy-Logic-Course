% Shahab Sotudian-94125091

A=-4:0.01:6;
B=0:0.01:9;
sizeA=size(A);
sizeB=size(B);

% Max Operation
Mxoperation=(max(A(1),B(1))):0.01:(max(A(sizeA(2)),B(sizeB(2))));

% Plotting
subplot(3,3,1)
y1 = zeros(1,sizeA(2));
plot(A,y1,'b','linewidth',4)
title('A=[-4,6]')
axis([-5,10,0,5])
subplot(332)
y2=zeros(1,sizeB(2));
plot(B,y2,'c','linewidth',4)
axis([-5,10,0,5])
title('B=[0,9]')
subplot(333)
sizeMaxoperation=size(Mxoperation);
y3=zeros(1,sizeMaxoperation(2));
plot(Mxoperation,y3,'k','linewidth',4)
axis([-5,10,0,5])
title('MAX')