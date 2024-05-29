N = 50;

tols = [1e-3, 1e-8, 1e-13];
nit_res = zeros(length(tols), 1);
sols = zeros(N, length(tols));

for i = 1:length(tols)
    tol = tols(i);
    [x, nit] = newton(@fun, zeros(N, 1), tol, 100000);
    sols(:, i) = x;
    nit_res(i) = nit;
end

pointer = ['*', 'o', '+'];
for i = 1:length(tols)
    plot(1:N, sols(:, i), pointer(i));
    hold on;
end
hold off;
xlabel('Posizione nel vettore soluzione')
title('Soluzione');