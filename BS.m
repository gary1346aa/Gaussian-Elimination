function [x] = BS(u,b) %Back substitution in column order


    [n,~] = size(u);
    x = zeros(n,1);
    
    for j = n : -1 : 1
        if u(j,j) == 0 break;
        end
        x(j) = b(j)/u(j,j);
        for i = 1 : j-1
            b(i) = b(i) - u(i,j)*x(j);
        end
    end

end
