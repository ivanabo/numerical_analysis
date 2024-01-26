function [y,t] = trapezna_sustav (f, t0, y0, T, n)

m=max(size(y0));
y = zeros(m,n);
x = zeros(1,n);
y(:,1) = y0;
t(1) = t0;
h = (T-t0) / n;

for i = 1:n
    t(i+1) = t(i) + h;
    g = @(z) -z + y(:,i) + h / 2 * ( f(t(i),y(:,i)) + f(t(i+1),z) );    
    %pomocu eulera racunam onaj y_k+1
    y0 = y(:,i) + h * f(t(i),y(:,i));

    y(:,i+1) = fsolve(g,y0,optimset( 'Display', 'off' ));
    
end
