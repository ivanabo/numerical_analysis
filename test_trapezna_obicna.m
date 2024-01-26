%test za (obicnu) trapeznu formulu
y0 = 1;
n = 50;
t0 = 0;
T = 3;

f = @(x,y) -y-5*exp(-x)*sin(5*x);

[y,t] = trapezna(f, t0, y0, T, n);

plot(t,y,'b');
hold on;
fplot('exp(-x)*cos(5*x)',[0 3],'r-');
grid on;
xlabel('t');
ylabel('y(t)');
hold off;