nn = (1:100);
llChebyshev = lebesgue(0, 1, nn, 1);
llEquidistanti = lebesgue(0, 1, nn, 0);

semilogy(nn, llChebyshev);
hold on
semilogy(nn, llEquidistanti);
hold off


