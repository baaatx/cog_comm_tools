% Function to initialize the PTB window used for an experiment.
%
% fontName   = Name of font to use.
%
% fontSize   = Font Size.
%
% fontStyle  = Font Style.
%
% desiredRes = (optional) resolution to attempt to set screen to...
%
%
% Author: Brian Armstrong
%
function [window, resolution] = initializeWindow(fontName, fontSize, fontStyle, desiredRes)
    
    % Choosing the display with the highest display number is a best guess about where you want the stimulus displayed.
    screens=Screen('Screens');
    screenNumber=max(screens);

    % provide a default resolution
    if (nargin < 4)
        desiredRes = [1024 768];
    end
    
    % set window to resolution 'nearest' to desired resolution
    NearestResolution(screenNumber,desiredRes);
    
    % Open window with default settings
    window=Screen('OpenWindow', screenNumber);

    % call back and check the resolution
    resolution=Screen('Resolution', window); 
    
    % set text font, style and size
    Screen('TextFont',window, fontName);
    Screen('TextSize',window, fontSize);
    Screen('TextStyle', window, fontStyle);   