%  Shahab Sotudian--94125091
%  Alfa cut
disp('*** Alfa cut in triangular membership function ***')
disp('Enter the parameter of triangular membership function ***')
disp('--->>   0<a<b<c')

a=input('Enter the amount of  a ');
b=input('Enter the amount of  b ');
c=input('Enter the amount of  c ');
x=0:0.5:(c+2);

% triangular membership function
y = zeros(size(x));
% Left and right shoulders (y = 0)
index = find(x <= a | c <= x);
y(index) = zeros(size(index));

% Left slope of membership
if (a ~= b)
    index = find(a < x & x < b);
    y(index) = (x(index)-a)/(b-a);
end
% right slope of membership
if (b ~= c)
    index = find(b < x & x < c);
    y(index) = (c-x(index))/(c-b);
end

% Center (y = 1)
index = find(x == b);
y(index) = ones(size(index));

% CUTS
% First Cut alfa
n=input('Enter the amount of  alfa in the first cut(0 =< alfa =< 1): ');
l = ones(size(y));
l(:)=n;
disp('>>> First cut set :')
z = find(y>=n);
x(z)

% second Cut alfa
g=input('Enter the amount of  alfa in the second cut(0 =< alfa =< 1): ');
k = ones(size(y));
k(:)=g;
disp('>>> Second cut set :')
t = find(y>=g);
x(t)


% third Cut alfa
h=input('Enter the amount of  alfa in the third cut(0 =< alfa =< 1): ');
j = ones(size(y));
j(:)=h;
disp('>>> Third cut set :')
v = find(y>=h);
x(v)



 %   plotting
 figure
subplot(2,3,1)
x_length = length(x);
z = zeros(1,x_length);
col = y;  % This is the color, vary with y in this case.
surface([x;x],[y;y],[z;z],[col;col],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',3);
       xlabel('MF')
 
 subplot(2,3,2)
     plot(x,y,'c','linewidth',3)
  axis([0 (c+2) 0  1.1]);
  hold on
  plot(x,l,'r--','linewidth',1)
xlabel('First cut')

subplot(2,3,3)
  plot(x,k,'k--','linewidth',1)
  hold on
   plot(x,y,'c','linewidth',3)
   axis([0 (c+2) 0  1.1]);
xlabel('Second Cut')
 
subplot(2,3,4)
  plot(x,j,'g--','linewidth',1)
  hold on
   plot(x,y,'c','linewidth',3)
   axis([0 (c+2) 0  1.1]);
xlabel('Third Cut')

 subplot(2,3,5)
  plot(x,j,'g--','linewidth',1)
  hold on
   plot(x,y,'c','linewidth',3)
   axis([0 (c+2) 0  1.1]);
   hold on
   plot(x,k,'k--','linewidth',1)
   hold on
   plot(x,l,'r--','linewidth',1)
   xlabel('All')
 
