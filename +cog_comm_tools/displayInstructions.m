% Function that displays the instructions in 'str' on the screen. 
% Wait 'delay' long before allowing to continue by pressing any key.
%
% Author: Brian Armstrong
%
function displayInstructions(window, str, delay)
    if (nargin < 3)
        delay = 1;
    end
    
    FlushEvents('keyDown');
    DrawFormattedText(window, [str '\n\n\n(Press Any Key To Continue)'], 150, 'center', 0, 55, [], [],1.5);
    Screen('Flip',window);
    WaitSecs(delay);
    KbWait();