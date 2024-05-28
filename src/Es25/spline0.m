function yy = spline0(x, y, xx)
%
%  yy = spline0(x, y, xx)
%
%  Calcola la spline cubica naturale interpolante e
%  restituisce il valore assunto dalla spline sulle ascisse xx
%
% Input:
%   x - vettore delle ascisse di interpolazione
%   y - vettore dei valori della funzione assunti sulle ascisse
%      interpolanti
%   xx - vettore delle ascisse dove si calcola il valore della spline
% 
% Output:
%   yy - vettore delle ordinate calcolate sulle ascisse
% 

n = length(x);

% Controlli di consistenza
if   length(y) ~= n
    error('Dati errati');
end

n = n-1; 
h(1:n) = x(2:n+1) - x(1:n);
b = h(2:n-1)./(h(2:n-1) + h(3:n)); % phi
 c = h(2:n-1)./(h(1:n-2) + h(2:n-1)); % csi
a(1:n-1) = 2;
df = ddspline(x, y, 3);

m = tridia(a, b, c, 6*df); % risoluzione del sistema tridiagonale
m = [0, m, 0];

yy = zeros(size(xx));

j = 1;
for i=2:n+1
    ri  = y(i-1) - (h(i-1)^2)/6 * (m(i-1)); 
    qi = (y(i) - y(i-1))/h(i-1) - h(i-1)/6*(m(i) - m(i-1));
    while j <= length(xx) && xx(j) <= x(i) 
        yy(j) = ((xx(j) - x(i-1))^3 * m(i) + (x(i) - xx(j))^3 * m(i-1))/ ...  
            (6*h(i-1)) + qi*(xx(j) - x(i-1)) + ri;  
        j = j+1;
    end 
end  
return;
end 
