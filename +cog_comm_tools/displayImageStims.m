% Display images data in array 'imageStims' to window.
%
% Remember: TOP LEFT CORNER OF SCREEN is x=0, y=0.
%
% Author: Brian Armstrong
%
function displayImageStims(window, imageStims)
    for i=1:length(imageStims)
        cog_comm_tools.drawImageDataAtDestRect(window, imageStims(i).imageData, imageStims(i).destRect);
    end
    Screen('Flip', window);