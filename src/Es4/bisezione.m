function [x, i, flag] = bisezione(f, a, b, tolx)
    flag = 0;
    fa = feval(f, a);
    fb = feval(f, b);

    if fa*fb > 0
        error("Gli estremi devono essere di segno opposto");
    end
    
    n_max = ceil(log2(b-a)-log2(tolx));
    
    for i=1:n_max
        x = (a+b)/2;
        fx = feval(f, x);

        if (abs(fx)*abs(b-a))/abs(fb-fa) <= tolx
            flag = 1;
            return
        end
        
        if fa*fx<0
            b=x;
            fb=fx;
        else
            a=x;
            fa=fx;
        end
    end
end