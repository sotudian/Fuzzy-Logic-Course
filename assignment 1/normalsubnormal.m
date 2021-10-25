%  Shahab Sotudian--94125091
% Normal membership function
disp('*** Example of Normal and sub Normal membership function ***')
l=[0 1 2 3 4 5 6 7 8 9 10]
s=[0 0 0.5 1 0.75 0.5 0.25 0 0 0 0]

% sub Normal membership function

x=[0 1 2 3 4 5 6 7 8 ]
y=[0 0 1.25 2.5 3.75 5 2.5 0 0]


figure
subplot(1,3,1)
x_length = length(x);
z = zeros(1,x_length);
col = y;  % This is the color, vary with y in this case.
surface([x;x],[y;y],[z;z],[col;col],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',3);
  xlabel('sub Normal MF')
  axis([0 10 0  5.1]);
  
 subplot(1,3,2)
  l_length = length(l);
z = zeros(1,l_length);
u = l;  % This is the color, vary with y in this case.
surface([l;l],[s;s],[z;z],[u;u],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',3);
     axis([0 10 0  5.1]);
 xlabel('Normal MF')

subplot(1,3,3)
x_length = length(x);
z = zeros(1,x_length);
col = y;  % This is the color, vary with y in this case.
surface([x;x],[y;y],[z;z],[col;col],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',3);
     axis([0 10 0  5.1]);
hold on
l_length = length(l);
z = zeros(1,l_length);
u = l;  % This is the color, vary with y in this case.
surface([l;l],[s;s],[z;z],[u;u],...
        'facecol','no',...
        'edgecol','interp',...
        'linew',3);
     axis([0 10 0  5.1]);
xlabel('Both')
