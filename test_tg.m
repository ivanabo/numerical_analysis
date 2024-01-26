% test metoda Runge-Kutta
y0 = 0;
n = 50;
t0 = 0;
T = 1;

f = @(x,y) y*tan(x)+1/cos(x);

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
figure(1)
plot(t,y,'b');
hold on;
fplot('x/cos(x)',[0 1],'r');
grid on;
xlabel('t');
ylabel('y(t)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% test metoda Kutta i Heun


% matrica M za metodu Kutta
M = zeros(4,4);
M(2,1) = 1/2;
M(3,1) = 1;
M(2,2) = 1/2;
M(3,2) = -1;
M(4,2) = 1/6;
M(3,3) = 2;
M(4,3) = 2/3;
M(4,4) = 1/6;

[y,t] = KuttaHeun(f, t0, y0, T, n, M);

% matrica N za metodu Heun
N = zeros(4,4);
N(2,1) = 1/3;
N(3,1) = 1;
N(2,2) = 1/3;
N(4,2) = 1/4;
N(3,3) = 2/3;
N(4,4) = 3/4;

[py,pt] = KuttaHeun(f, t0, y0, T, n, N);
figure(2)
plot(t,y,'m');
hold on;
fplot('x/cos(x)',[0 1],'r');
grid on;
xlabel('t');
ylabel('y(t)');

hold on;

plot(pt,py,'b--');
legend('Kutta','egzaktno rješenje','Heun');