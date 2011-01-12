% Checks to see if a space bar key was pressed, so the experimenter can pause the experiment.
% Once the experiment is paused, the experimenter can press the space bar
% again to resume the experiment.
%
%
% Author: Brian Armstrong
%
function checkForSpaceKeyToPause()
    cog_comm_tools.checkForKeyToPause('space');