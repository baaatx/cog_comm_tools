% Draws image data in array 'imageStims' to window  BUT DOES NOT FLIP SCREEN.
%
% window - the window pointer
%
% imageStims - an array of imageStim objects
%
%
% Author: Brian Armstrong
%
function myTextures = drawImageStims(window, imageStims)
    myTextures = [];
    for i=1:length(imageStims)
        myTexture = cog_comm_tools.drawImageDataAtDestRect(window, imageStims(i).imageData, imageStims(i).destRect);
        myTextures = [myTextures myTexture];
    end