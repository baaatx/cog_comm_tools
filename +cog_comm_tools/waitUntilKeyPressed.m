% Function that waits until a key is pressed to proceed. An Example of a valid key is 'space' or 'a' for the spacebar and 
% 'a' key respectively.
%
% key - the string representation of a key on the keyboard
%
%
% Author: Brian Armstrong
%
function waitUntilKeyPressed(key)
    keyValue = KbName(key);
    proceed = false;
    while (proceed == false)
        KbWait();
        if (cog_comm_tools.checkForKeyPress(keyValue))
            proceed = true;
        end
    end