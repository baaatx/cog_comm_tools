% Wrapper that Displays cross hairs centered.
%
% window - the window pointer
%
%
% Author: Brian Armstrong
%
function displayCrossHairsCentered(window)
    cog_comm_tools.displayImageAtDestRect(window, 'stimuli/images/cross_hairs.jpg', []);