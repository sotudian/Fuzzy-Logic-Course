% Shahab Sotudian-94125091

A=2:0.01:5;
B=-1:0.01:4;
sizeA=size(A);
sizeB=size(B);

% Multiplication 
a1=A(1)*B(1);
a2=A(1)*B(sizeB(2));
a3=A(sizeA(2))*B(1);
a4=A(sizeA(2))*B(sizeB(2));
K=[a1,a2,a3,a4];
e=min(K);
d=max(K);
Subtract=e:0.01:d;

% Plotting
subplot(3,3,1)
y1=zeros(1,sizeA(2));
plot(A,y1,'b','linewidth',4)
title('A=[2,5]')
axis([-7,26,0,5])
subplot(332)
y2=zeros(1,sizeB(2));
plot(B,y2,'r','linewidth',4)
axis([-7,26,0,5])
title('B=[-1,4]')
subplot(333)
sizesub=size(Subtract);
y3=zeros(1,sizesub(2));
plot(Subtract,y3,'k','linewidth',4)
axis([-7,26,0,5])
title('Multiplication : A*B=[-5,20]')