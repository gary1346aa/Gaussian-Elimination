function [x] = BSR(u,b);


    [n,~] = size(u);
    x = zeros(n,1);
    
    for j = n : -1 : 1
        if u(j,j) == 0 break;
        end
        for i = j+1 : n
            b(j) = b(j) - u(j,i)*x(i,1);
        end
        x(j) = b(j)/u(j,j);
    end

end