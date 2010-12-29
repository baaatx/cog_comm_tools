% Function that sets the destRect fields of all ImageStim elements of a
% list to the cooresponding grid position determined by the paramaters.
%
% imageStims - a list (matrix / array) of ImageStim objects.
%
% destRects - the (N x 4 matrix) of destRects. (rows)
%
%
% Author: Brian Armstrong
%
function imageStims = setAndFitImageStimDestRects(imageStims, destRects)
    % set and fit the destRect of each imageStim to the cooresponding destRect row in destRects.
    for i=1:length(imageStims)
        imageStims(i).destRect = cog_comm_tools.fitDestRect(destRects(i,:), imageStims(i).destRect);
    end