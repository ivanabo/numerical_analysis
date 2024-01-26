function [y,t] = trapezna (f, t0, y0, T, n)

h = (T-t0) / n;
y = zeros(n,1);
y(1) = y0;
t(1) = t0;

for i = 1:n
    t(i+1) = t(i) + h;
    g = @(x) -x +y(i)+ h * ( f(t(i),y(i)) + f(t(i+1),x) )/2;
    
    %pocetnu iteraciju dobivam preko eulera
    x0= y(i) + h * f(t(i),y(i));
  
    y(i+1)= fsolve(g,x0,optimset( 'Display', 'off' ));
    
end
