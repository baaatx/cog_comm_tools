% Wrapper that gets the current text color
%
% window - the window pointer
%
% Author: Brian Armstrong
%
function textColor = getCurrentTextColor(window)

    % noticed a bug with TextColor - we can no longer
    % get the old color without setting a new one...
    black = cog_comm_tools.getRGBColor('black');
    textColor = Screen('TextColor', window, black);
    
    % bug in PTB, no longer allows simple check so we
    % have to set the screen color back to what it was set to.
    Screen('TextColor', window, textColor);

end

