% Wrapper for PTB Screen Flip (draws the video buffer to the display)
%
% window - the window to flip (draw buffer to screen)
%
%
% Author: Brian Armstrong
%
function displayWindow(window)
    % check for window pointer...
    if (nargin ~= 1)
        error ('no window pointer argument...');
    end
    
    % PTB screen flip...
    Screen('Flip', window);