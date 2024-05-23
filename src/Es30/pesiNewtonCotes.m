function c = pesiNewtonCotes(n)
%
% c = pesiNewtonCotes(n)
%
% Function che restituisce i pesi della quadratura
% della formula di Newton-Cotes di grado n
%
% Input:
% n: grado della formula
%
% Output:
% c: pesi della quadratura
%
% Controlli di consistenza
if n < 1 || n > 9 || n == 8
    error("Input errato");
end

c = zeros(1, n+1);

for i=0:n
    d = i - [0:i-1 i+1:n];
    den = prod(d);
    a = poly([0:i-1 i+1:n]);
    a = [a./((n+1):-1:1) 0];
    num = polyval(a, n);
    c(i+1) = num / den;
end

return;
end