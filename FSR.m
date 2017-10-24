function [x] = FSR(u,b); %Forward substitution in row order


    [n,~] = size(u);
    x = zeros(n,1);
    
    for j = 1 : n
        if u(j,j) == 0 break;
        end
        for i = 1 : j-1
            b(j) = b(j) - u(j,i)*x(i,1);
        end
        x(j) = b(j)/u(j,j);
    end

end