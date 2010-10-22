% Wrapper that gets integer tokens from a larger string (integer numbers seperated by white space)
%
% Author: Brian Armstrong
%
function tokens = getIntegerTokens(str)
    result = textscan(str, '%d');
    tokens = result{1};