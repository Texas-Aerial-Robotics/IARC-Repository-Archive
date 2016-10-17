function vector = freemanDirection(msub)
vector = 69;
[height, width] = size(msub);
direction = [7, 0, 1; 6, 69, 2; 5, 4, 3];
for row=1:height
    for col=1:width
        
        if msub(row, col) == 0
            if row ==2 && col ==2
                break
            end
            vector = direction(row, col);
            
            
        end
    end
    
end

