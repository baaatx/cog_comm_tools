% Wrapper for PTB Screen Flip (draws the video buffer to the display)
%
% window - the window to flip (draw buffer to screen)
%
%
% Author: Brian Armstrong
%
function drawWindow(window)
    Screen('Flip', window);