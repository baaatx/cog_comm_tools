% Wrapper that gets float tokens from a larger string (floating point numbers seperated by white space)
%
% str - the string to scan
%
%
% Author: Brian Armstrong
%
function tokens = getFloatTokens(str)
    result = textscan(str, '%f');
    tokens = result{1};