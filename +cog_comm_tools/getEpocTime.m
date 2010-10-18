% Wrapper that returns the epoc time
%
% Author: Brian Armstrong
%
function epoc = getEpocTime()
    % gets the number of seconds since Jan 1 1970,
    % commonly used for timestamping.
    epoc = etime(clock,[1970 1 1 0 0 0]);
    