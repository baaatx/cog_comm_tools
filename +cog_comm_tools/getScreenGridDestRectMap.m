% Function that returns the correct rectangular sub-sections of the screen for gridding a
% subsection (or entire) screen into rows * columns grids in a map object with
% coordinate keys in the form [row column].  
%
% Returns a map with [row column] key for each cell in the grid.
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
function gridRectMap = getScreenGridDestRectMap(minX, maxX, minY, maxY, rows, columns, paddingWidth, forceSquare)
    % Get the transpose of the column version
    gridRectRows = cog_comm_tools.transpose(cog_comm_tools.getScreenGridRects(minX, maxX, minY, maxY, rows, columns, paddingWidth, forceSquare));
    
    % the map object
    gridRectMap = containers.Map();
        
    currentRow=1;
    
    % put destRects into map with corresponding 'row,col' string keys
    for x=1:rows
        for y=1:columns
            gridRectMap([num2str(x) ',' num2str(y)]) = gridRectRows(currentRow,:);
            currentRow = currentRow + 1;
        end
    end