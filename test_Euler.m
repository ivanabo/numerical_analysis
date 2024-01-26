% test za Eulerovu metodu
% tražimo rješenje inicijalnog problema:
%       y'(t) = -y(t) -5e^-t sin(5t), t in [0,3]
%       y(0) = 1
% n = 30
% egzaktno rješenje je: y(t) = e^-t cos(5t)

y0 = 1;
n = 30;
t0 = 0;
T = 3;

f = @(x,y) -y-5*exp(-x)*sin(5*x);

[y,t] = Euler(f, t0, y0, T, n);

plot(t,y,'g');
hold on;
fplot('exp(-x)*cos(5*x)',[0 3],'r-');
grid on;
xlabel('t');
ylabel('y(t)');

hold on;

[py,pt] = pEuler(f, t0, y0, T, n);
plot(pt,py,'b');
legend('Euler aproksimacija','egzaktno rješenje','poboljšani Euler');