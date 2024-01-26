% test za Laplaceovu jednadžbu

a = 0;
b = 4;

n = 20;

u1 = @(x,y) exp(y)-cos(y);
u2 = @(x,y) exp(y)*cos(4)-exp(4)*cos(y);
u3 = @(x,y) cos(x)-exp(x);
u4 = @(x,y) exp(4)*cos(x)-exp(x)*cos(4);



