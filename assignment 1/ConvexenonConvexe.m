%  Shahab Sotudian--94125091
% Convexe membership function
disp('*** Example of Convexe and non Convexe MF ***')
x=[0 1 2 3 4 5 6 7 8 9 10];
y=[0 0 0.5 1 0.75 0.5 0.25 0 0 0 0];

% non Convexe membership function

l=[0 1 2 3 4 5 6 7 8 9 10];
s=[0 0 0.5 1 0.25 1 0.75 0.5 0.25 0 0];

% plotting 
figure
subplot(1,2,1)
 x_length = length(x);
z = zeros(1,x_length);
col = y;  % This is the color, vary with y in this case.
surface([x;x],[y;y],[z;z],[col;col],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',3);
 xlabel('Convexe MF')
 axis([0 10 0  1.1]);
 subplot(1,2,2)
  l_length = length(l);
u = zeros(1,l_length);
p = s;  % This is the color, vary with y in this case.
surface([l;l],[s;s],[u;u],[p;p],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',3);
xlabel('non Convexe MF')
 axis([0 10 0  1.1]);


