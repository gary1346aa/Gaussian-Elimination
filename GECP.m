function [G,x] = GECP(A,y);

    [row,~] = size(A);
    G = [A,y];
    
    index = 1 : row;
    
    for j = 1 : row - 1
        R = G(j:end,j:end-1);
        [~,I] = max(R(:));
        [max_row, max_col] = ind2sub(size(R),I);
        G([j,max_row + j - 1],:) = G([max_row + j - 1,j],:);
        G(:,[j,max_col + j - 1]) = G(:,[max_col + j - 1,j]);
        index([j,max_col + j - 1]) = index([max_col + j - 1,j]);
        for i = j + 1 : row
            G(i,:) = G(i,:) - (G(i,j)/G(j,j)).*G(j,:);
        end
    end
    
    for i = row : -1 : 1
        S = 0;
        for j = i + 1 : row
           S = S + G(i,j)*x(index(j),1);
        end
        x(index(i),1) = (G(i,end) - S)/G(i,i);
    end
    
end