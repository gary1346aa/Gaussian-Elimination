function [G,x] = GERP(A,y) %Gaussain Elimination with Rook's pivoting

    [row,~] = size(A);
    G = [A,y];
    
    index = 1 : row;
    
    for j = 1 : row - 1
        Row = G(j,j:end-1);
        Col = G(j:end,j);
        [Mr,Ir] = max(Row(:));
        [Mc,Ic] = max(Col(:));
        if Mc >= Mr
            G([j,Ic + j - 1],:) = G([Ic + j - 1,j],:);
        elseif Mc < Mr
            G(:,[j,Ir + j - 1]) = G(:,[Ir + j - 1,j]);
            index([j,Ir + j - 1]) = index([Ir + j - 1,j]);
        end
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