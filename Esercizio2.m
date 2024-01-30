x = linspace(1, 5/3, 100001);
y = f(x);

plot(x, y);

function y=f(x)
    y=1+x.^2+log(abs(3*(1-x)+1))/80;
end