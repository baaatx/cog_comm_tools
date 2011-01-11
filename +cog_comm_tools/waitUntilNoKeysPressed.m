% Function that waits until no keys are pressed down on the keyboard before
% moving on...
%
% timeOut - (optional) time in seconds 
%
%
% Author: Brian Armstrong
%
function waitUntilNoKeysPressed(timeOut)
    
    % timeout flag.
    useTimeOut = true;

    if (nargin == 0)
       useTimeOut = false;
    end

    % the loop flag...
    keyIsDown = true;

    % save start time...
    startTime = GetSecs();
    
    % loop while a key is down and the duration is less than time out value (if there is one)...
    while (keyIsDown && (useTimeOut && ( (GetSecs() - startTime) < timeOut) || ~useTimeOut) )
        [ keyIsDown, seconds, keyCode ] = KbCheck();
        WaitSecs(0.0001);
    end   