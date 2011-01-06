% Wrapper to set the deafault overlay image for the current trial.
%
% Assumes that the image is in the experiments stimuli/images folder.
%
% Author: Brian Armstrong
%
function EyelinkSetOverlayImage(imageFileName)
    message = ['!V IMGLOAD FILL ../../../stimuli/images/' imageFileName];
    Eyelink('Message', message);