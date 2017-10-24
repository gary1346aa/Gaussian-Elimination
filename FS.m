function [x] = FS(u,b);


    [n,~] = size(u);
    x = zeros(n,1);
    
    for j = 1 : n
        if u(j,j) == 0 break;
        end
        x(j) = b(j)/u(j,j);
        for i = j+1 : n
            b(i) = b(i) - u(i,j)*x(j);
        end
    end

end