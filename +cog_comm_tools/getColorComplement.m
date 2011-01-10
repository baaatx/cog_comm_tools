% Returns a complemntary color to the given RGB Color.
%
% RGBColor - a 1x3 matrix of uint8 values [red green blue]
%
%
% Author: Brian Armstrong
%
function RGBColorComplement = getColorComplement(RGBColor)
    % return the 'complentary' color (middle gray doesn't have a
    % complement)
    RGBColorComplement = [ 0 0 0 ];
    RGBColorComplement(1) = 255 - RGBColor(1);
    RGBColorComplement(2) = 255 - RGBColor(2);
    RGBColorComplement(3) = 255 - RGBColor(3);