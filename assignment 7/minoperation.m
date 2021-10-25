% Shahab Sotudian-94125091

A=-2:0.01:6;
B=3:0.01:9;
sizeA=size(A);
sizeB=size(B);

% MIN Operation
MINoperation=(min(A(1),B(1))):0.01:(min(A(sizeA(2)),B(sizeB(2))));

% Plotting
subplot(3,3,1)
y1=zeros(1,sizeA(2));
plot(A,y1,'k','linewidth',4)
title('A=[-2,6]')
axis([-5,10,0,5])
subplot(332)
y2=zeros(1,sizeB(2));
plot(B,y2,'c','linewidth',4)
axis([-5,10,0,5])
title('B=[3,9]')
subplot(333)
sizeMINoperation=size(MINoperation);
y3=zeros(1,sizeMINoperation(2));
plot(MINoperation,y3,'r','linewidth',4)
axis([-5,10,0,5])
title('MIN')