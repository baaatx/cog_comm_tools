% Wrapper that gets string tokens from a larger string (words seperated by the string delimiter)
%
% Author: Brian Armstrong
%
function tokens = getDelimitedStringTokens(str, delimiter)
    result = textscan(str, '%s' , 'delimiter' , delimiter);
    tokens = result{1};