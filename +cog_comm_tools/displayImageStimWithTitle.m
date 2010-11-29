% Displays image data in 'imageStim' to window with it's title centered. 
%
% window - the window pointer
%
% imageStim - an imageStim object
%
%
% Author: Brian Armstrong
%
function displayImageStimWithTitle(window, imageStim)
    % draw the image stim to the screen with it's title
    cog_comm_tools.drawImageStimWithTitle(window, imageStim, fontSize);
    
    % Draw the window buffer...
    drawWindow(window);