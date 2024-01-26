% test metoda Runge-Kutta
y0 = 1;
n = 40;
t0 = 0;
T = 3;

f = @(x,y) -y-5*exp(-x)*sin(5*x);

% matrica M za metodu Kutta
M = zeros(5,5);
M(2,1) = 1/2;
M(3,1) = 1/2;
M(4,1) = 1;
M(2,2) = 1/2;
M(5,2) = 1/6;
M(3,3) = 1/2;
M(5,3) = 1/3;
M(4,4) = 1;
M(5,4) = 1/3;
M(5,5) = 1/6;

[y,t] = KuttaHeun(f, t0, y0, T, n, M);

plot(t,y,'g.');
hold on;
fplot('exp(-x)*cos(5*x)',[0 3],'r');
grid on;
xlabel('t');
ylabel('y(t)');