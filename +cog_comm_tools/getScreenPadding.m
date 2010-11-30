% Wrapper to return a uniform screen padding for formatting functions based
% on the resolution of window.
%
% window - the window pointer
%
%
% Author: Brian Armstrong

function [xPad, yPad] = getScreenPadding(window)

resolution = Screen('Resolution', window);

xPad = (resolution.width / 7);
yPad = (resolution.height / 7);