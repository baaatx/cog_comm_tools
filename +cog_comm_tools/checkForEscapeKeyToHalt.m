% Checks to see if an escape key was pressed, so the experimenter can stop the
% experiment.
%
% Author: Brian Armstrong

function checkForEscapeKeyToHalt()
    escapeKey = KbName('ESCAPE');
    if cog_comm_tools.checkForKeyPress(escapeKey)
        cog_comm_tools.shutDownExperiment();
        error('Experiment Halted with Escape Key');
    end    