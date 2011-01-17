% Function that waits until no keys are pressed down on the keyboard before
% moving on...
%
% timeOut - (optional) timeOut in seconds. If argument for this parameter
%   is passed, after timeOut seconds, the method
%   will continue even if a key is still pressed down. 
%
%
% Author: Brian Armstrong
%
function waitUntilNoKeysPressed(timeOut)
    
    % timeout flag.
    useTimeOut = true;

    % timeOut is optional
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
    
    % get rid of any lingering keyDown events...
    FlushEvents('keyDown');