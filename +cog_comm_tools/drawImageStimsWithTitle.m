% Draws image data in 'imageStim' to window with it's title centered. BUT DOES NOT FLIP SCREEN.
%
% Remember: TOP LEFT CORNER OF SCREEN is x=0, y=0.
%
% Author: Brian Armstrong
%
function drawImageStimsWithTitle(window, imageStims)
    for i=1:length(imageStims)
        cog_comm_tools.drawImageStimWithTitle(window, imageStims(i));
    end