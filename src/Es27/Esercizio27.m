rng(0);
xi = linspace(0, 2*pi, 101);
yi = sin(xi)+rand(size(xi))*.05;

V = vander(xi).';

a = yi*V^(-1);

plot((1:101), a);