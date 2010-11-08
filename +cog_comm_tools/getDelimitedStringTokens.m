% Wrapper that gets string tokens from a larger string (words seperated by the string delimiter)
%
% str - the string to scan
%
% delimter - the delimiter string
%
%
% Author: Brian Armstrong
%
function tokens = getDelimitedStringTokens(str, delimiter)
    result = textscan(str, '%s' , 'delimiter' , delimiter);
    tokens = result{1};