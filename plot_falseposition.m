% This file is used to plot result from falseposition.f95
%
% Created by: Aulia Khalqillah,S.Si(2019)
%
% Load data
data = load('falsepoint.txt');
index = data(:,1);
root = data(:,7);
froot = data(:,8);
error = data(:,9);

% Fucntion of x^2 + 2x + 1
xi = -3;
xf = 3;
N = 100;
h = (xf-xi)/N;
x = xi:h:xf-h;
f = (x.^2)-(2*x)+1;

% Plot Function
subplot(311)
plot(x,f,'linewidth',1)
hold on
plot([root(end) root(end)], [froot(end) froot(end)],'.r','markersize',30)
xlabel('X')
ylabel('F(X)')
title('Original Funtion')

% Plot root
subplot(312)
plot(index,root,'linewidth',1)
xlabel('Index')
ylabel('Root')
title('Result of Root')

% Plot error of root
subplot(313)
plot(index,error,'linewidth',1)
xlabel('Index')
ylabel('Error (%)')
title('Percent of error')
