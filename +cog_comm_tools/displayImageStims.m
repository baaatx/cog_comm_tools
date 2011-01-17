% Display images data in array 'imageStims' to window.
%
% window - the window pointer
%
% imageStims - an array of imageStim objects
%
%
% Author: Brian Armstrong
%
function displayImageStims(window, imageStims)
    % draw each image stim in the list
    for i=1:length(imageStims)
        cog_comm_tools.drawImageDataAtDestRect(window, imageStims(i).imageData, imageStims(i).destRect);
    end
    
    % now that they have all been drawn, flip the screen.
    cog_comm_tools.displayWindow(window);