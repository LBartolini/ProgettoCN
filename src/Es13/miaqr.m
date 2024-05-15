function [x, nr] = miaqr(A, b)
% 
%   [x,nr] = miaqr(A,b)
% 
% Esegue la fattorizzazione QR di A e restituisce la soluzione ai minimi
% quadrati del sistema lineare e la norma del corrispondente vettore
% residuo
% 
% Input:
%   A: matrice m x n
%   b: vettore dei termini noti
% Output:
%   x: soluzione del sistema Ax = b
%   nr: norma vettore residuo
% 
[m,n] = size(A);
for i = 1:n
    alfa = norm(A(i:m, i));
    if alfa == 0        
        error('Matrice non a rango massimo');
    end   
    if A(i,i) >= 0        
        alfa = -alfa;
    end   
    v1 = A(i,i) - alfa;
    A(i,i) = alfa;
    A(i+1:m, i) = A(i+1:m, i) / v1;
    beta = -v1 / alfa;
    A(i:m, i+1:n) = A(i:m, i+1:n) - (beta * [1; A(i+1:m, i)]) * ([1 A(i+1:m, i)'] * A(i:m, i+1:n));
    
    b(i:m) = b(i:m) - (beta * [1 A(i+1:m, i)'] * b(i:m)) * [1; A(i+1:m, i)];
end  
% Risoluzione sistema Ax=b
x = b(:);
for i = n:-1:1   
    x(i) = x(i) / A(i,i);
    x(1:i-1) = x(1:i-1)   - A(1:i-1, i) * x(i);
end  
x = x(1:n);

% Norma del vettore residuo
w = [0.5 0.5 0.75 0.25 0.25].';
r = A*x - b;
nr = sqrt(sum(w.*(r.^2)));
return;
end