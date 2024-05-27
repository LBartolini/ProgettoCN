function YQ = spline0(X, Y, XQ)
%
%  YQ = spline0(X, Y, XQ)
%
%  Calcola la spline cubica naturale interpolante sulle ascisse passate in
%  XQ
%
% Input:
%   X - ascisse di interpolazione
%   Y - valori della funzione assunti sulle ascisse interpolanti
%   XQ - ascisse su cui calcolare la spline
% 
% Output:
%   YQ - vettore delle ordinate calcolate sulle ascisse
% 

n = length(X);

% Controlli di consistenza
if   length(Y) ~= n
    error('Dati errati');
end

n = n-1; 
h(1:n) = X(2:n+1) - X(1:n);
b = h(2:n-1)./(h(2:n-1) + h(3:n)); % phi
 c = h(2:n-1)./(h(1:n-2) + h(2:n-1)); % csi
a(1:n-1) = 2;
df = ddspline(X, Y, 3);

m = tridia(a, b, c, 6*df); % risoluzione del sistema tridiagonale
m = [0, m, 0];

YQ = zeros(size(XQ));

j = 1;
for i=2:n+1
    ri  = Y(i-1) - (h(i-1)^2)/6 * (m(i-1)); 
    qi = (Y(i) - Y(i-1))/h(i-1) - h(i-1)/6*(m(i) - m(i-1));
    while j <= length(XQ) && XQ(j) <= X(i) 
        YQ(j) = ((XQ(j) - X(i-1))^3 * m(i) + (X(i) - XQ(j))^3 * m(i-1))/ ...  
            (6*h(i-1)) + qi*(XQ(j) - X(i-1)) + ri;  
        j = j+1;
    end 
end  
return
end 
