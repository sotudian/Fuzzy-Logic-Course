% Shahab Sotudian-94125091

A=3:0.01:9;
B=2:0.01:6;
sizeA=size(A);
sizeB=size(B);

% Subtraction
Subtract=(A(1)-B(sizeB(2))):0.01:(A(sizeA(2))-B(1));

% Plotting
subplot(3,3,1)
y1=zeros(1,sizeA(2));
plot(A,y1,'r','linewidth',4)
title('A=[3,9]')
axis([-5,10,0,5])
subplot(332)
y2=zeros(1,sizeB(2));
plot(B,y2,'b','linewidth',4)
axis([-5,10,0,5])
title('B=[2,6]')
subplot(333)
sizeAdd=size(Subtract);
y3=zeros(1,sizeAdd(2));
plot(Subtract,y3,'y','linewidth',4)
axis([-5,10,0,5])
title('Subtraction: A-B=[-3,7]')