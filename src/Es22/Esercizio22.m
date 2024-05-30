nn = (1:100);
llChebyshev = lebesgue(0, 1, nn, 1);
llEquidistanti = lebesgue(0, 1, nn, 0);

semilogy(nn, llChebyshev, "DisplayName", "Ascisse di Chebyshev [0, 1]");
hold on
semilogy(nn, llEquidistanti, "DisplayName", "Ascisse Equidistanti [0, 1]");
hold on

llChebyshev = lebesgue(-5, 8, nn, 1);
llEquidistanti = lebesgue(-5, 8, nn, 0);

semilogy(nn, llChebyshev, "DisplayName", "Ascisse di Chebyshev [-5, 8]");
hold on
semilogy(nn, llEquidistanti, "DisplayName", "Ascisse Equidistanti [-5, 8]");
hold off

title("Approssimazione della costante di Lebesgue");
xlabel("Grado del polinomio");
ylabel("lebesgue");
legend("Location", "Best");

