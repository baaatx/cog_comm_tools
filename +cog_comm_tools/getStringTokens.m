% Wrapper that gets string tokens from a larger string (words seperated by white space)
%
% Author: Brian Armstrong
%
function tokens = getStringTokens(str)
    result = textscan(str, '%s');
    tokens = result{1};