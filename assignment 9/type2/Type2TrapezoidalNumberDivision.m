clear
clc
%  Shahab Sotudian--94125091
% Trapezoidal Number Operations
% Type_II fuzzy Trapezoidal  Number A
a1L=1;
a2L=4;
a3L=7;
a4L=10;

a1U=1.5;
a2U=4.5;
a3U=6.5;
a4U=9.5;
% Type_II fuzzy Trapezoidal Number B
b1L=2.5;
b2L=5.5;
b3L=8.5;
b4L=11.5;

b1U=3.2;
b2U=6.2;
b3U=7.8;
b4U=10.8;

alfa=0;
y=[];
l = -5:0.1:15;
% alfa cut
AL=[((a2L-a1L)*alfa+a1L),(-(a4L-a3L)*alfa+a4L)];
BL=[((b2L-b1L)*alfa+b1L),(-(b4L-b3L)*alfa+b4L)];

AU=[((a2U-a1U)*alfa+a1U),(-(a4U-a3U)*alfa+a4U)];
BU=[((b2U-b1U)*alfa+b1U),(-(b4U-b3U)*alfa+b4U)];

% Division 
for i=1:1:101
    alfa=(i-1)/100;
   y(i)=alfa;
s1L(i)=((a2L-a1L)*alfa+a1L)./((b2L-b1L)*alfa+b1L);
s2L(i)=(-(a4L-a3L)*alfa+a4L)./(-(b4L-b3L)*alfa+b4L);

s1U(i)=((a2U-a1U)*alfa+a1U)./((b2U-b1U)*alfa+b1U);
s2U(i)=(-(a4U-a3U)*alfa+a4U)./(-(b4U-b3U)*alfa+b4U);

end



       subplot(311)
h1=trapmf(l,[1 4 7 10]);
plot(l,h1,'b','linewidth',1.5)
hold on
h2=trapmf(l,[1.5 4.5 6.5 9.5]);
plot(l,h2,'b','linewidth',1.5)
title('Type II Trapezoidal fuzzy Number A')
axis([0,14,0,1.1])

       subplot(312)
h3=trapmf(l,[2.5,5.5,8.5,11.5]);
plot(l,h3,'r','linewidth',1.5)
hold on
h4=trapmf(l,[3.2,6.2,7.8,10.8]);
plot(l,h4,'r','linewidth',1.5)
title('Type II Trapezoidal fuzzy Number B')
axis([0,14,0,1.1])

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

axis([0,2,0,1.1])
title('Division -------Type II Trapezoidal fuzzy Number')












