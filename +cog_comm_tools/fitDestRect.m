% Fits an innerDestRect into a destRect without changing the width to
% height ratio. newDestRect should fit 'inside' of destRect without
% warping.
%
% destRect - the outer destRect (to fit to)
%
% innerDestRect - the destRect to draw inside destRect
%
%
% Author: Brian Armstrong
%
function newDestRect = fitDestRect(destRect, innerDestRect)
    
    newDestRect = [ 0 0 0 0 ];
    
    destRectWidth = abs(destRect(3) - destRect(1));
    destRectHeight = abs(destRect(4) - destRect(2));
    
    innerDestRectWidth = abs(innerDestRect(3) - innerDestRect(1));
    innerDestRectHeight = abs(innerDestRect(4) - innerDestRect(2));
    
    widthRatio = innerDestRectWidth / destRectWidth;
    heightRatio = innerDestRectHeight / destRectHeight;
        
    % use width
    if ( innerDestRectWidth >= innerDestRectHeight )
        %make height match
        innerDestRectHeight = round(inv(widthRatio) * innerDestRectHeight);
        
        %align height
        dy = abs(round((destRectHeight - innerDestRectHeight) / 2));
        
        newDestRect(1) = destRect(1);
        newDestRect(2) = destRect(2) + dy;
        newDestRect(3) = destRect(3);
        newDestRect(4) = newDestRect(2) + innerDestRectHeight;
                        
    % use height
    else
        %make width match
        innerDestRectWidth = round(inv(heightRatio) * innerDestRectWidth);
                
        %align width        
        dx = abs(round((destRectWidth - innerDestRectWidth) / 2));
        
        newDestRect(1) = destRect(1) + dx;
        newDestRect(2) = destRect(2);
        newDestRect(3) = newDestRect(1) + innerDestRectWidth;
        newDestRect(4) = destRect(4);
    end