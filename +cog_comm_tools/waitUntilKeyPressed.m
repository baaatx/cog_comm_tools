% Function that waits until a particular key is pressed to proceed. 
% 
% keyCode - the string representation of a key on the keyboard
%   An Example of a valid keyCode is 'space' or 'a' for the spacebar and 
%   'a' key respectively.
%
%  Note: To determine a keyCode for a key, just type 'KBName' and press
%  enter at the MATLAB command prompt.  Then press any key.  The function
%  will return the keycode for the pressed key.
%
%
% Author: Brian Armstrong
%
function waitUntilKeyPressed(keyCode)
    keyValue = KbName(keyCode);
    proceed = false;
    
    % supress text from matlab window
    ListenChar(2);
    
    % continue until 'key' is pressed...
    while (proceed == false)
        KbWait();
        if (cog_comm_tools.checkForKeyPress(keyValue))
            proceed = true;
        end
    end
    
    % get rid of any lingering keyDown events...
    FlushEvents('keyDown');
        
    % un-supress text from matlab window
    ListenChar(1);
    
    