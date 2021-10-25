%  Shahab Sotudian--94125091
% ********* The support of membership function *********
disp('*** The support of triangular membership function ***')
disp('Enter the parameter of triangular membership function ***')
disp('--->>   0<a<b<c')

a=input('Enter the amount of  a ');
b=input('Enter the amount of  b ');
c=input('Enter the amount of  c ');
x=0:0.001:(c+2);

%triangular membership function
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

% The support of membership function
s = find(y>0);
figure
subplot(1,2,1)
 plot(x,y,'b','linewidth',3)
 axis([0 (c+2) 0  1.1]);
 xlabel('Triangular membership function')
 subplot(1,2,2)
  plot(x(s),y(s),'c','linewidth',2)
  axis([0 (c+2) 0  1.1]);
xlabel('The support of membership function')

