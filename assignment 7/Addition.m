% Shahab Sotudian-94125091

A=1:0.01:4;
B=2:0.01:5;
sizeA=size(A);
sizeB=size(B);

% Addition
Add=(A(1)+B(1)):0.01:(A(sizeA(2))+B(sizeB(2)));

% Plotting
subplot(3,3,1)
y1=zeros(1,sizeA(2));
plot(A,y1,'g','linewidth',4)
title('A=[1,4]')
axis([0,10,0,5])
subplot(332)
y2=zeros(1,sizeB(2));
plot(B,y2,'b','linewidth',4)
axis([0,10,0,5])
title('B=[2,5]')
subplot(333)
sizeAdd=size(Add);
y3=zeros(1,sizeAdd(2));
plot(Add,y3,'r','linewidth',4)
axis([0,10,0,5])
title('Addition')