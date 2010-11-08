% Display image data in 'imageStim' to window centered (ignore destRect).
%
% window - the window pointer
%
% imageStim - an imageStim object
%
%
% Author: Brian Armstrong
%
function displayImageStimCentered(window, imageStim)
    cog_comm_tools.displayImageDataAtDestRect(window, imageStim.imageData, []);