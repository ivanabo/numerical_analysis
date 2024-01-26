function [y,t] = Runge_Kutta(f, t0, y0, T, n, M)

y = zeros(n,1);
y(1) = y0;
t(1) = t0;
h = (T-t0) / n;

for i = 1:n
    psi1 = f(t(i),y(i));
    psi2 = f(t(i)+M(2,1)*h,y(i)+h*M(2,2)*psi1);
    psi3 = f(t(i)+M(3,1)*h,y(i)+h*(M(3,2)*psi1+M(3,3)*psi2));
    psi4 = f(t(i)+M(4,1)*h,y(i)+h*(M(4,2)*psi1+M(4,3)*psi2+M(4,4)*psi3));
    
    t(i+1) = t(i) + h;
    y(i+1) = y(i) + h * (M(5,2)*psi1 + M(5,3)*psi2 + M(5,4)*psi3 + M(5,5)*psi4);
end