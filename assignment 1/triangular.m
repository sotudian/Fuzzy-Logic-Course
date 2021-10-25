%  Shahab Sotudian--94125091
disp('*** Triangular membership function ***')
disp('Enter the parameter of triangular membership function ***')
disp('--->>   0<a<b<c')

a=input('Enter the amount of  a ');
b=input('Enter the amount of  b ');
c=input('Enter the amount of  c ');
x=0:0.1:(c+2);
%***********  triangular membership function  ***********
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

% PLOTTING
x_length = length(x);
z = zeros(1,x_length);
col = y;  % This is the color, vary with y in this case.
surface([x;x],[y;y],[z;z],[col;col],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',3);
 axis([0 (c+2) 0  1.1]);
 xlabel('Triangular Membership Function')

