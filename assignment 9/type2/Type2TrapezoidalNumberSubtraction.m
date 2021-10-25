clear
clc
%  Shahab Sotudian--94125091
% Trapezoidal Number Operations
% Type_II fuzzy Trapezoidal  Number A
a1L=1;
a2L=5;
a3L=9;
a4L=12;

a1U=2;
a2U=6;
a3U=8;
a4U=11;
% Type_II fuzzy Trapezoidal Number B
b1L=2;
b2L=3;
b3L=8;
b4L=10;

b1U=2.5;
b2U=3.5;
b3U=7.5;
b4U=9.5;

alfa=0;
y=[];
l = -5:0.1:15;
% alfa cut
AL=[((a2L-a1L)*alfa+a1L),(-(a4L-a3L)*alfa+a4L)];
BL=[((b2L-b1L)*alfa+b1L),(-(b4L-b3L)*alfa+b4L)];

AU=[((a2U-a1U)*alfa+a1U),(-(a4U-a3U)*alfa+a4U)];
BU=[((b2U-b1U)*alfa+b1U),(-(b4U-b3U)*alfa+b4U)];

% Subtraction
for i=1:1:101
    alfa=(i-1)/100;
   y(i)=alfa;
s1L(i)=((a2L-a1L)*alfa+a1L)-(-(b4L-b3L)*alfa+b4L);
s2L(i)=(-(a4L-a3L)*alfa+a4L)-((b2L-b1L)*alfa+b1L);

s1U(i)=((a2U-a1U)*alfa+a1U)-(-(b4U-b3U)*alfa+b4U);
s2U(i)=(-(a4U-a3U)*alfa+a4U)-((b2U-b1U)*alfa+b1U);

end



       subplot(311)
h1=trapmf(l,[1 5 9 12]);
plot(l,h1,'b','linewidth',1.5)
hold on
h2=trapmf(l,[2 6 8 11]);
plot(l,h2,'b','linewidth',1.5)
title('Type II Trapezoidal fuzzy Number A')
axis([-10,13,0,1.1])

       subplot(312)
h3=trapmf(l,[2,3,8,10]);
plot(l,h3,'r','linewidth',1.5)
hold on
h4=trapmf(l,[2.5,3.5,7.5,9.5]);
plot(l,h4,'r','linewidth',1.5)
title('Type II Trapezoidal fuzzy Number B')
axis([-10,13,0,1.1])

      subplot(313)
plot(s1L,y,'c','linewidth',2)
hold on
plot(s2L,y,'c','linewidth',2)
hold on
s3L=s1L(101):0.1:s2L(101);
p=ones([size(s3L),1]);
plot(s3L,p,'c','linewidth',2)
hold on
plot(s1U,y,'c','linewidth',2)
hold on
plot(s2U,y,'c','linewidth',2)
hold on
s3U=s1U(101):0.1:s2U(101);
p=ones([size(s3U),1]);
plot(s3U,p,'c','linewidth',2)

axis([-10,13,0,1.1])
title('Subtraction-------Type II Trapezoidal fuzzy Number')












