

g = @(x,t) sin(0.5*pi*x)+0.5*sin(2*pi*x);
ro0 = @(x) 0;
ro1 = @(t) exp(-pi^2*t/4);

a = 0;
b = 1;

t0 = 0;
T = 2;

m = 150;
n = 5;

[z,x,t] = nrpdj(a,b,t0,T,g,ro0,ro1,m,n);

figure(1)
[X,Y] = meshgrid(x,t);
Z = exp(-pi*pi*Y/4).*sin(0.5*pi*X)+0.5*exp(-4*pi*pi*Y).*sin(2*pi*X);
surf(X,Y,Z);

figure(2)
surf(X,Y,z);
