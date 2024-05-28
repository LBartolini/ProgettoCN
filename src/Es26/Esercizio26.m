runge = @(x) 1 ./ (1 + x.^2);
a = 0;
b = 10;
x_eval = linspace(a, b, 10001);
f_eval = runge(x_eval);

n_values = 4:4:800;
h_values = 10 ./ n_values;
errore_natural = zeros(size(n_values));
errore_not_a_knot = zeros(size(n_values));

for i = 1:length(n_values)
    n = n_values(i);
    
    xi = linspace(a, b, n + 1);
    fi = runge(xi);
    
    f_spline_natural = spline0(xi, fi, x_eval);
    f_spline_not_a_knot = fnval(csapi(xi, fi), x_eval);
    
    errore_natural(i) = max(abs(f_eval - f_spline_natural));
    errore_not_a_knot(i) = max(abs(f_eval - f_spline_not_a_knot));
end

figure;
loglog(h_values, errore_natural, '-o', 'DisplayName', 'Spline Naturale');
hold on;
loglog(h_values, errore_not_a_knot, '-x', 'DisplayName', 'Spline Not-a-Knot');
hold off;
xlabel('h');
ylabel('Errore di approssimazione');
title('Errore di approssimazione con spline interpolanti');
legend('Location', 'Best');