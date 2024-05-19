function YQ = newton(X, Y, XQ)
% 
%   YQ = newton(X, Y, XQ)
% 
% Calcola il polinomio interpolante in forma di Newton definito dalle
% coppie (Xi, Yi) nei punti del vettore XQ
% 
% Input:
%   (X,Y): dati del problema
%   XQ: matrice in cui calcolare il polinomio
% 
% Output:
%   YQ: Polinomio interpolante in forma di Newton

if length(X) ~= length(Y) ||   length(X) <= 0    
    error('Dati errati');
end
%Controllo che le componenti del vettore X siano distinte
if length(unique(X)) ~= length(X)
    error('Le ascisse non sono distinte');  
end   

df = diffdiv(X, Y);
n = length(df) - 1; 
YQ = df(n+1) * ones(size(XQ));
for i = n:-1:1   
    YQ = YQ.*(XQ - X(i  )) + df(i);
end  

return;
end