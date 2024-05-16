function dy = hornerDerivata(x, ai, xi)
%
% dy = hornerDerivata(x, ai, xi) 
%      Calcola la derivata prima nel punto x
%       del polinomio p(x) dove ai sono i coefficienti della base di Newton
%
% Input:
%   x: Ascissa su cui valutare la derivata 
%   ai: Coefficienti del pominomio 
%   xi: Ascisse su cui valutare la base di Newton
%
% Output:
%   dy: Derivata prima calcolata nel punto x

n = length(ai);
if n ~= length(xi)-1
    error('Dimensione degli input non consistente');
end

dy = 0;
b = ai(n); 

for k = n-1:-1:1
    dy = b + (x - xi(k)) * dy;
    b = ai(k) + (x - xi(k)) * b;
end

return;
end