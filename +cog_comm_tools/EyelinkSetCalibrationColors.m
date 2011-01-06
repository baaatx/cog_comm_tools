% Wrapper for setting the Eyelink Calibration Colors.
%
% NOTE: If you don't specify colors, function defaults to a black background with
% white and gray text. You should call this after you initialize Eyelink and before you calibrate
% Eyelink. Colors are values from 0 to 255 or additive RGB (red green blue) values such as [255 255 255] for white... see PTB
% 'help Screen' for PTB color information...
%
% NOTE: You must keep the el return value to call calibration, etc.
%
%
% el - the Eyelink defaults structure you get when you initialize eyelink
% defaults. (return value of initializeEyelink(...) )
% 
% backgroundcolour - (optional)
%
% foregroundcolour - (optional)
%
% msgfontcolour - (optional)
%
% imgtitlecolour - (optional)
%
%
% Author: Brian Armstrong
%
function el = EyelinkSetCalibrationColors(el, backgroundcolour, foregroundcolour, calibrationtargetcolour, msgfontcolour, imgtitlecolour)

    if (nargin > 1)
        el.backgroundcolour = backgroundcolour;
    else
        el.backgroundcolour = BlackIndex(el.window);
    end

    if (nargin > 2)
        el.foregroundcolour = foregroundcolour;
    else
        el.foregroundcolour = WhiteIndex(el.window);
    end
    
    if (nargin > 3)
       el.calibrationtargetcolour = calibrationtargetcolour;
    else
       el.calibrationtargetcolour = WhiteIndex(el.window);
    end
    
    if (nargin > 4)
        el.msgfontcolour = msgfontcolour;
    else
        el.msgfontcolour = WhiteIndex(el.window);
    end
   
    if (nargin > 5)
        el.imgtitlecolour = imgtitlecolour;
    else
        el.imgtitlecolour = GrayIndex(el.window);
    end
        	
    % this is important, sets these setting to the call back object
    % (applies them) so they actually get used during calibration...
    
    PsychEyelinkDispatchCallback(el);