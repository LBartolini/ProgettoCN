for n=1:100
    An = ones(n).*-1;
    An = An + diag(ones(1, n)*n + 1);

    LDLt = mialdlt(An);
    D = diag(diag(LDLt));
    
    
end
plot((1:n), diag(D), '*');