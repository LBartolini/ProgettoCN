[x, nit] = newton(@fun, zeros(50, 1), 1e-6, 1000);

disp(x);