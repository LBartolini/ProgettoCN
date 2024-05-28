[x, nit] = newton(@fun, zeros(50, 1), 1e-3, 5);
disp(x);