norms = (1:15);
for n=1:15
    % soluzione reale
    xn = ones(1, n).';

    An = ones(n);
    for i=1:n
        v = [ones(1, i) 10.^(1:n-i)].';
        An(:, i) = v;
    end
    bn = ones(1, n).*n - (1:n) + (10.^(1:n)-1)/9;
    bn = bn.';

    x = mialu(An, bn);
    norms(i) = norm(x-xn);
end 

semilogy((1:15), norms);
title("Norma di x-xn");
xlabel("n");
ylabel("Norma (scala logaritmica)");