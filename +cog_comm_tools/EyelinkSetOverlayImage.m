% Wrapper to set the deafault overlay image for the current trial.
%
%
% Author: Brian Armstrong
%
function EyelinkSetOverlayImage(imageFileName)
    message = ['!V IMGLOAD FILL ../../../stimuli/images/' imageFileName];
    Eyelink('Message', message);