rng(0);

xi = linspace(0, 2*pi, 101);
yi = sin(xi) + rand(size(xi)) * 0.05;

n = length(xi);

V = zeros(n, 4);
for i = 1:n
    V(i, :) = [xi(i)^3, xi(i)^2, xi(i), 1];
end

a = V \ yi';
yi_fit = polyval(a, xi);

figure;
plot(xi, yi, '*', 'DisplayName', 'Dati originali');
hold on;
plot(xi, yi_fit, '-', 'DisplayName', 'Polinomio di grado 3');
legend("Location", "Best");
xlabel('xi');
ylabel('yi');
title('Approssimazione ai minimi quadrati con polinomio di grado 3');