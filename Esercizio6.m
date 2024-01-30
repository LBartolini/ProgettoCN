f = @(x) (exp(x)-cos(x));
df = @(x) (exp(x)+sin(x));

tolx = 1e-3;
disp("1e-3");
[x, i] = Bisezione(f, -0.1, 1, tolx);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = Newton(f, df, 1, tolx, 1000);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = Secanti(f, 1, 0.9, tolx, 1000);
disp("Secanti " + x + " Iterazioni: " + i);

tolx = 1e-6;
disp("1e-6");
[x, i] = Bisezione(f, -0.1, 1, tolx);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = Newton(f, df, 1, tolx, 1000);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = Secanti(f, 1, 0.9, tolx, 1000);
disp("Secanti " + x + " Iterazioni: " + i);

tolx = 1e-9;
disp("1e-9");
[x, i] = Bisezione(f, -0.1, 1, tolx);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = Newton(f, df, 1, tolx, 1000);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = Secanti(f, 1, 0.9, tolx, 1000);
disp("Secanti " + x + " Iterazioni: " + i);

tolx = 1e-12;
disp("1e-12");
[x, i] = Bisezione(f, -0.1, 1, tolx);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = Newton(f, df, 1, tolx, 1000);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = Secanti(f, 1, 0.9, tolx, 1000);
disp("Secanti " + x + " Iterazioni: " + i);