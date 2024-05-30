function df = ddspline(x, y, it)
%
%   df = ddspline(x, y, it)
%
% Calcola le differenze divise sulle coppie (xi, fi)
% terminando alla it-esima iterazione
%
% Input:
%   x - vettore delle ascisse
%   y - vettore delle ordinate
% Output:
%   df - vettore delle differenze divise
%

n = length(x);
if length(y) ~= n
    error('Dati errati');
end
n = n-1;
df = y;
for j=1:it-1
    for i = n+1:-1:j+1
        df(i) = (df(i) - df(i-1))/(x(i) - x(i-j));
    end
end
df = df(1, it:n+1);

return;
end