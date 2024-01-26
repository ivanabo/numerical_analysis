function [y,t] = kruti_sistem_trapezna (f,t0, Y0, T, n, A)

y = zeros(m,n);
y(:,1) = y0;
t(1) = t0;
h = (T-t0) / n;

for i = 1:n
    t(i+1) = t(i) + h;
    g = @(z) -z + y(:,i) + h / 2 * ( A*f(t(i),y(:,i)) + A*f(t(i+1),z) );    
    %pomocu eulera racunam onaj y_k+1
    y0 = y(:,i) + h * A*f(t(i),y(:,i));

    y(:,i+1) = fsolve(g,y0,optimset( 'Display', 'off' ));
    
end