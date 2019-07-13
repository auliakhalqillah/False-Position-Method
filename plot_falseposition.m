% This file is used to plot result from falseposition.f95
%
% Created by: Aulia Khalqillah,S.Si(2019)
%
% Load data
data = load('falseposition.txt');
index = data(:,1);
root = data(:,2);
froot = data(:,3);
error = data(:,4);

% Fucntion of x^2 + 2x + 1
xi = -3;
xf = 3;
N = 100;
h = (xf-xi)/N;
x = xi:h:xf-h;
f = (x.^2)+(2*x)+1;

% Plot Function
subplot(311)
plot(x,f)
hold on
plot([root(end) root(end)], [froot(end) froot(end)],'.r','markersize',30.)
xlabel('X')
ylabel('F(X)')
title('Original Funtion')

% Plot root
subplot(312)
plot(index,root)
xlabel('Index')
ylabel('Root')
title('Result of Root')

% Plot error of root
subplot(313)
plot(index,error)
xlabel('Index')
ylabel('Error (%)')
title('Percent of error')
