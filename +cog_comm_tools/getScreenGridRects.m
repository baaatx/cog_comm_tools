% Returns the correct rectangular sub-sections of the screen for gridding a
% subsection (or entire) screen into rows * columns grids.
%
% Returns a matrix with 4 rows and 'columns' * 'rows' columns, because this
% is the coordinate input that functions that display multiple images expect.
%
% Use this function for getting the appropriate destinationRect(angle)s for
% displaying multiple images (or mapping a single image) into rows and
% columns.
%
% minX - smallest x value of the screen to use
%
% maxX - largest x value of the screen to use
%
% minY - smallest y value of the screen to use
%
% maxY - largest y value of the screen to use
%
% row - the number of rows
%
% columns - the number of columns
%
% paddingWidth - the number of pixels to pad between each row and column
%
% forceSquare - to force grid to be squares, set this boolean to true
%
%
% Author: Brian Armstrong
%
function gridRects = getScreenGridRects(minX, maxX, minY, maxY, rows, columns, paddingWidth, forceSquare)
    
    % check for usage
    if (nargin < 6)
       error('usage :  getScreenGridRects(minX, maxX, minY, maxY, rows, columns, [paddingWidth,] [forceSquare])');
    end

    % default for forceSquare is false
    if (nargin < 7)
        paddingWidth = 0;
    end
    
    % default for forceSquare is false
    if (nargin < 8)
        forceSquare = false;
    end    
    
    % compute dx and dy
    dx = ( ((maxX - minX)- paddingWidth*(columns-1)) / columns );
    dy = ( ((maxY - minY)- paddingWidth*(rows-1)) / rows ) ;
    xAdjust = 0;
    
    % force grid to be squares by using the smaller dy dimension.
    if (forceSquare)
        minimumDim = min(dx, dy);
        % use the smaller dy dimension for dy x dy squares
        dx = minimumDim;
        dy = minimumDim;
        
        % adjustment for x coordinates if forceSquare is used
        xAdjust =  ( ( maxX - ((dx * columns) + (columns * paddingWidth)) ) / 2 ) ;
    end

    % the return value
    gridRects = [];
    
    % for each row
    for r=0:rows-1
        y1 = minY + (r * dy) + (paddingWidth*r);
        y2 = minY + (r * dy) + dy + (paddingWidth*r);

        % for each column
        for c=0:columns-1
            % increase x coordinates by dx
            x1 = minX + (c * dx) + xAdjust + (paddingWidth*c);
            x2 = minX + (c * dx) + dx + xAdjust + (paddingWidth*c);
            
            % next column of coordinates
            nextCol = [ x1; y1; x2; y2;];

            % add the column to return value
            gridRects = [gridRects nextCol];
        end
    end