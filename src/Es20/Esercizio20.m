fun = @(x) (exp(x/2 + exp(-x)));
funPrime = @(x) (.5*exp(exp(-x) - x/2).*(-2 + exp(x)));

xi = [0 2.5 5];
fi = fun(xi);
f1i = funPrime(xi);

x = linspace(0, 5, 1000);

yHermite = hermite(xi, fi, f1i, x);
yTrue = fun(x);

plot(x, yTrue, "DisplayName", "True");
hold on

plot(x, yHermite, "DisplayName", "Hermite");
hold on

dfTrue = funPrime(x);

% Calcolo dei vettori raddoppiati
xiRaddoppiato = repelem(xi, 2);
fi = repelem(fi, 2);
for i = 1:length(f1i)
    fi(i*2) = f1i(i);
end
dd = ddHermite(xi, fi);

plot(x, hornerDerivata(x, dd, xiRaddoppiato), "DisplayName", "Derivata Hermite");
hold on

plot(x, dfTrue, "DisplayName", "Derivata True");
hold off

title("Approssimazione di Hermite");
xlabel("x");
ylabel("y");
legend("Location", "Best");