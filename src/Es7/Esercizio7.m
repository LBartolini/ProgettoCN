f = @(x) exp(x) - cos(x) + sin(x) - x*(x+2);
deriv = @(x) exp(x) + sin(x) + cos(x) - 2*x - 2;
molt = 5;
maxiter = 1000;

tolx = 1e-3;
disp("1e-3");
[x, i] = bisezione(f, -0.1, 1, tolx);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = newton(f, deriv, 1, tolx, maxiter);
disp("Newton " + x + " Iterazioni: " + i);
[x, i] = newtonModificato(f, deriv, 1, molt, tolx, maxiter);
disp("Newton modificato " + x + " Iterazioni: " + i);
[x, i] = secanti(f, 1, 0.9, tolx, maxiter);
disp("Secanti " + x + " Iterazioni: " + i);

fprintf('\n');

tolx = 1e-6;
disp("1e-6");
[x, i] = bisezione(f, -0.1, 1, tolx);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = newton(f, deriv, 1, tolx, maxiter);
disp("Newton " + x + " Iterazioni: " + i);
[x, i] = newtonModificato(f, deriv, 1, molt, tolx, maxiter);
disp("Newton modificato " + x + " Iterazioni: " + i);
[x, i] = secanti(f, 1, 0.9, tolx, maxiter);
disp("Secanti " + x + " Iterazioni: " + i);

fprintf('\n');

tolx = 1e-9;
disp("1e-9");
[x, i] = bisezione(f, -0.1, 1, tolx);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = newton(f, deriv, 1, tolx, maxiter);
disp("Newton " + x + " Iterazioni: " + i);
[x, i] = newtonModificato(f, deriv, 1, molt, tolx, maxiter);
disp("Newton modificato " + x + " Iterazioni: " + i);
[x, i] = secanti(f, 1, 0.9, tolx, maxiter);
disp("Secanti " + x + " Iterazioni: " + i);

fprintf('\n');

tolx = 1e-12;
disp("1e-12");
[x, i] = bisezione(f, -0.1, 1, tolx);
disp("Bisezione " + x + " Iterazioni: " + i);
[x, i] = newton(f, deriv, 1, tolx, maxiter);
disp("Newton " + x + " Iterazioni: " + i);
[x, i] = newtonModificato(f, deriv, 1, molt, tolx, maxiter);
disp("Newton modificato " + x + " Iterazioni: " + i);
[x, i] = secanti(f, 1, 0.9, tolx, maxiter);
disp("Secanti " + x + " Iterazioni: " + i);