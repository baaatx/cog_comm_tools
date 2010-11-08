% Function that waits until the space key is pressed to proceed.
%
%
% Author: Brian Armstrong
%
function waitUntilSpaceKey()
    cog_comm_tools.waitUntilKeyPressed('space');    