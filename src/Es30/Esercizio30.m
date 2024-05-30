fun = @(x) (exp(3*x));
primitiva = @(x) (exp(3*x)/3);
true_val = primitiva(1)-primitiva(0);

[If, err] = composita(fun, 0, 1, 6, 12);
true_err = true_val-If;