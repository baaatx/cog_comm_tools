% Function to initialize the PTB window used for an experiment.
%
% fontName   = Name of font to use.
%
% fontSize   = Font Size.
%
% fontStyle  = Font Style.
%
% desiredRes = resolution to try to set screen to
%
%
% Author: Brian Armstrong
%
function [window, res] = initializeWindow(fontName, fontSize, fontStyle, desiredRes)
    % Choosing the display with the highest display number is a best guess about where you want the stimulus displayed.
    screens=Screen('Screens');
    screenNumber=max(screens);

    if (nargin < 4)
        desiredRes = [800 600];
    end
    
    res=NearestResolution(screenNumber,desiredRes);
    
    % Open window with default settings:
    window=Screen('OpenWindow', screenNumber);

    % Select specific text font, style and size:
    Screen('TextFont',window, fontName);
    Screen('TextSize',window, fontSize);
    Screen('TextStyle', window, fontStyle);
    
    % Enable unified mode of KbName, so KbName accepts identical key names on all operating systems:
    KbName('UnifyKeyNames');