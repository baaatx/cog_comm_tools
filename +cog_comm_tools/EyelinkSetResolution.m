% Wrapper to set resolution to use with Eyelink.
%
% maxX - the width of the screen resolution
%
% mayY - the height of the screen resolution
%
%
% Author: Brian Armstrong
%
function status = EyelinkSetResolution(maxX, maxY)
    command = ['screen_pixel_coords = 0.0, 0.0,' num2str(maxX) '.0 , ' num2str(maxY) '.0'];
    status = cog_comm_tools.EyelinkCommand(command);    