% Wrapper that gets the current text size
%
% window - the window pointer
%
% Author: Brian Armstrong
%
function textSize = getCurrentTextSize(window)

    % noticed a bug with TextSize - we can no longer
    % get the old color without setting a new one...
    % so set it to 30 temporarily
    textSize = Screen('TextSize', window, 30);
    
    % bug in PTB, no longer allows simple check so we
    % have to set the text size back to what it was set to.
    Screen('TextSize', window, textSize);

end

