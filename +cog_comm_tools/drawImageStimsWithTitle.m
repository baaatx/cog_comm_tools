% Draws image data in 'imageStim' to window with it's title centered. BUT DOES NOT FLIP SCREEN.
%
% window - the window pointer
%
% imageStims - an array of imageStim objects
%
%
% Author: Brian Armstrong
%
function drawImageStimsWithTitle(window, imageStims)
    for i=1:length(imageStims)
        cog_comm_tools.drawImageStimWithTitle(window, imageStims(i));
    end