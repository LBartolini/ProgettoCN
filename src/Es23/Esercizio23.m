f = @(x) (1./(1+x.^2));

x = linspace(-5, 5, 10001);
y = f(x);

normLagrange = (1:50);
normNewton = (1:50);

for n=1:50
    xCheby = chebyshev(2*n, -5, 5);
    yCheby = f(xCheby);
    
    yLagrange = lagrange(xCheby, yCheby, x);
    yNewton = newton(xCheby, yCheby, x);

    normLagrange(n) = norm(y-yLagrange);
    normNewton(n) = norm(y-yNewton);
end
semilogy((2:2:100), normLagrange);
hold on
semilogy((2:2:100), normNewton);
hold off