% Returns the correct rectangular sub-sections of the screen for gridding
% the screen into rows * columns grids.
%
% Returns a matrix with 4 rows and 'columns' * 'rows' columns, because this
% is the coordinate input that PTB functions that display multiple images expect.
%
% Author: Brian Armstrong
%
function gridRects = getScreenGridRects(maxX, maxY, rows, columns, paddingWidth, forceSquare)
    
    % default for forceSquare is false
    if (nargin < 6)
        forceSquare = false;
    end    
    
    % compute dx and dy
    dx = uint32 ((maxX-((columns-1)*paddingWidth)) / columns);
    dy = uint32 ((maxY-((rows-1)*paddingWidth)) / rows);
    xAdjust = 0;
    
    % force grid to be squares by using the smaller dy dimension.
    if (forceSquare)
        minimumDim = min(dx, dy);
        % use the smaller dy dimension for dy x dy squares
        dx = minimumDim;
        dy = minimumDim;
        % adjustment for x coordinates
        xAdjust =  uint32(( maxX - (dx * columns) ) / 2) ;
    end

    % the return value
    gridRects = [];
    
    % for each row
    for r=0:rows-1
        y1 = (r * dy) + (r * paddingWidth);
        y2 = y1 + dy;

        % for each column
        for c=0:columns-1
            % increase x coordinates by dx
            x1 = (c * dx) + (c * paddingWidth) + xAdjust;
            x2 = x1 + dx;
            
            % next column of coordinates
            nextCol = [ x1; y1; x2; y2;];

            % add the column to return value
            gridRects = [gridRects nextCol];
        end
    end