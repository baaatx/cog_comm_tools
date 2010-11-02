% Fits an innerDestRect column into a destRect column without changing the width to height ratio.
%
% newDestRectCol column should fit 'inside' of destRectCol without warping.
%
% Author: Brian Armstrong
%
function newDestRectCol = fitDestRectCol(destRectCol, innerDestRectCol)

    newDestRectCol = [ 0; 0; 0; 0; ];
    
    destRectColWidth = abs(destRectCol(3,1) - destRectCol(1,1));
    destRectColHeight = abs(destRectCol(4,1) - destRectCol(2,1));
    
    innerDestRectColWidth = abs(innerDestRectCol(3,1) - innerDestRectCol(1,1));
    innerDestRectColHeight = abs(innerDestRectCol(4,1) - innerDestRectCol(2,1));
    
    widthRatio = innerDestRectColWidth / destRectColWidth;
    heightRatio = innerDestRectColHeight / destRectColHeight;
        
    % use width
    if ( innerDestRectColWidth >= innerDestRectColHeight )
        %make height match
        innerDestRectHeight = round(inv(widthRatio) * innerDestRectColHeight);
        
        %align height
        dy = abs(round((destRectColHeight - innerDestRectHeight) / 2));
        
        newDestRectCol(1,1) = destRectCol(1,1);
        newDestRectCol(2,1) = destRectCol(2,1) + dy;
        newDestRectCol(3,1) = destRectCol(3,1);
        newDestRectCol(4,1) = newDestRectCol(2,1) + innerDestRectHeight;
                        
    % use height
    else
        %make width match
        innerDestRectWidth = round(inv(heightRatio) * innerDestRectColWidth);
                
        %align width        
        dx = abs(round((destRectColWidth - innerDestRectWidth) / 2));
        
        newDestRectCol(1,1) = destRectCol(1,1) + dx;
        newDestRectCol(2,1) = destRectCol(2,1);
        newDestRectCol(3,1) = newDestRectCol(1,1) + innerDestRectWidth;
        newDestRectCol(4,1) = destRectCol(4,1);
    end