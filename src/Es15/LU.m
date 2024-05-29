function x = LU(A,b)
%
%   Risolve il sistema Ax=b con fattorizzazione LU senza
%   pivoting parziale
%
%   x = LU(A,b)
%
%   input:
%   A- matrice Coefficienti
%   b-   vettore termini noti
%
%   output:
%   x- soluzione
%

[m,n] = size(A);

if m ~= n
    error("Matrice non quadrata");
end

if n~=length(b)
    error("Dimensione degli input incompatibile");
end

for i=1:n-1

    if A(i,i)==0
        error('Matrice singolare');
    end
    A(i+1:n,i)=A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n)=A(i+1:n,i+1:n)-A(i+1:n,i)*A(i,i+1:n);

end

x=b;
for i=1:n
    x(i+1:n) = x(i+1:n)-A(i+1:n,i)*x(i);
end
for i=n:-1:1
    x(i) = x(i)/A(i,i);
    x(1:i-1) = x(1:i-1)-A(1:i-1,i)*x(i);
end

return;
end