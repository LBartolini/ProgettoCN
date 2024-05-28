function [gradient, Jacobian] = fun(x)
N = 50;

if N ~= length(x)
    error("Dimensione di x errata");
end

syms xi [N 1];

alfa = 2;
beta = -1.1;
e = ones(N, 1);
Q = zeros(N) + diag(ones(1, N)*4) + diag(ones(1, N-1), 1) + diag(ones(1, N-1), -1);

f =.5*xi.'*Q*xi + e.'*(cos(alfa*xi) + beta*exp(-xi));
gradient = jacobian(f, xi).';
Jacobian = jacobian(gradient, xi);

Jacobian = eval(subs(Jacobian, xi, x));
gradient = eval(subs(gradient, xi, x));

return;
end