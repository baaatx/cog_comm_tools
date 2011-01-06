% Wrapper for PTB Screen Flip (draws the video buffer to the display)
%
% window - the window to flip (draw buffer to screen)
%
%
% Author: Brian Armstrong
%
function displayWindow(window)
    Screen('Flip', window);