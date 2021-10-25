% Shahab Sotudian-94125091

A=3:0.01:10;
C=1:0.01:5;
sizeA=size(A);
sizeC=size(C);


% Division 
r=min((1/C(sizeC(2))),(1/C(1)));
t=max((1/C(sizeC(2))),(1/C(1)));
B=r:0.01:t;
sizeB=size(B);
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
title('A=[3,10]')
axis([0,11,0,5])
subplot(332)
y2=zeros(1,sizeC(2));
plot(C,y2,'r','linewidth',4)
axis([0,11,0,5])
title('B=[1,5]')
subplot(333)
sizesub=size(Subtract);
y3=zeros(1,sizesub(2));
plot(Subtract,y3,'k','linewidth',4)
axis([0,11,0,5])
title('Division : A/B=[0.6,10]')