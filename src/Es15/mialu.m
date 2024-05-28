function x = mialu(A,b)
% 
%   x = mialu(A,b)
% 
% Metodo di fattorizzazione LU con pivoting parziale
% 
% Input:
%   A: matrice n x n
%   b: vettore dei termini noti
%
% Output:
%   x: soluzione del sistema Ax = b

% Controlli di consistenza
[m, n] = size(A);
if m ~= n
    error('Matrice non quadrata'); 
end   
if length(b) ~= n
    error('Dimensione vettore termini noti non corretta');
end   
% P conterrà il prodotto delle matrici di permutazione elementari generate 
% durante l'esecuzione dell'algoritmo
P = (1:n)';
% Fattorizzazione LU della matrice A, al termine avremo nella parte
% triangolare superiore della matrice il fattore U e nel restante il 
% fattore L mantenendo però nella diagonale gli elementi di U e non la 
% diagonale unitaria di L
for i = 1:n-1 
    [mi, ki] = max(abs(A(i:n, i)));
    if mi == 0        
        error('Matrice singolare');
    end   
    ki = ki+i-1;  
    if ki > i        
        A([i ki], :) = A([ki i], :);        
        P([i ki]) = P([ki i]);
    end   
    A(i+1:n, i) = A(i+1:n, i) / A(i,i);
    A(i+1:n, i+1:n) = A(i+1:n, i+1:n) - A(i+1:n, i) * A(i, i+1:n);
end  
%  Risoluzione del sistema
x = b(P);
for i = 2:n
    x(i:n) = x(i:n) - A(i:n, i-1) * x(i-1);   
end  
for i = n:-1:1   
    x(i) = x(i) / A(i,i);
    x(1:i-1) = x(1:i-1)   - A(1:i-1,i) * x(i);
end  
end