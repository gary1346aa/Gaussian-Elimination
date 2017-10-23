function [G,x] = GE(A,y);

    [row,~] = size(A);
    G = [A,y];
    
    for j = 1 : row - 1
        for i = j + 1 : row
            G(i,:) = G(i,:) - (G(i,j)/G(j,j)).*G(j,:);
        end
    end
    
    for i = row : -1 : 1
        S = 0;
        for j = i + 1 : row
           S = S + G(i,j)*x(j,1);
        end
        x(i,1) = (G(i,end) - S)/G(i,i);
    end
    
end