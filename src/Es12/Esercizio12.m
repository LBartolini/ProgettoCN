N=100;

for n=1:N
    An = ones(n).*-1;
    An = An + diag(ones(1, n)*n + 1);

    LDLt = mialdlt(An);

    plot((1:n), diag(LDLt));
    hold on
end
hold off