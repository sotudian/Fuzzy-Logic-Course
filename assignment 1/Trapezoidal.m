%  Shahab Sotudian--94125091
disp('*** Trapezoidal membership function ***')
disp('Enter the parameter of trapezoidal membership function ***')
disp('--->>   0<a<b<c<d')

a=input('Enter the amount of  a ');
b=input('Enter the amount of  b ');
c=input('Enter the amount of  c ');
d=input('Enter the amount of  d ');
x=0:0.1:(d+2);
%***********  Trapezoidal membership function  ************
y = zeros(size(x));
% Left and right shoulders (y = 0)
index = find(x <= a | d <= x);
y(index) = zeros(size(index));

% Left slope of membership
if (a ~= b)
    index = find(a < x & x < b);
    y(index) = (x(index)-a)/(b-a);
end
% Center (y = 1)
if (b ~= c)
    index = find(b <= x & x <= c);
    y(index) = ones(size(index));
end
% right slope of membership
if (c ~= d)
    index = find(c < x & x < d);
    y(index) = (d-x(index))/(d-c);
end

% PLOTTING
x_length = length(x);
z = zeros(1,x_length);
col = y;  % This is the color, vary with y in this case.
surface([x;x],[y;y],[z;z],[col;col],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',3);
 axis([0 (d+2) 0  1.1]);
  xlabel('Trapezoidal Membership Function')

