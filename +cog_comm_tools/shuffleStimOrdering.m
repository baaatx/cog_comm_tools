% Randomizes the order of a list of stim object keys, but only allows
% maxInOrder number of valid or invalid (care or don't care) stimuli to
% appear in a row, and no stim can appear twice in a row.
%
% stimMap - a containers.Map() of stim objects
%
% orderList - a cell array of keys that point to elements of stimMap
%
% lastStimCode - (optional) the code for the last stim used (in the last trial)
%
% maxInOrder - (optional) the maximum number of valid or invalid stims that can appear
% in a row in the ordering.
%
% maxTries - (optional) max number of times the function will try to randomize the
% ordering and obtain a correct answer. You may need to increase this for
% large ordering lists in order to obtain a truely randomized order.
%
% NOTE: If it is impossible (or improbable) to properly order the stims, this function will
% not provide a valid ordering and will error out.
%
%
% Author: Brian Armstrong
%
function orderList = shuffleStimOrdering(stimMap, orderList, lastStimCode, maxInOrder, maxTries)

    % lastStimCode defaults to ''
    if (nargin < 3)
        lastStimCode = '';
    end

    % maxInOrder defaults to 3
    if (nargin < 4)
        maxInOrder = 3;
    end

    % maxTries defaults to 300
    if (nargin < 5)
        maxTries = 300;
    end

    ready = false;
    
    % check that all keys in orderList are valid keys for the stimMap
    if (~isKey(stimMap, orderList))
        error ('orderList contains invalid keys for stimMap');
    end
    
    % while the ordering is not meeting the constraints...
    while (~ready && maxTries>0)
        orderList = cog_comm_tools.shuffleCellArray(orderList);
        if (cog_comm_tools.stimOrderMeetsConstraint(stimMap, orderList, maxInOrder, lastStimCode))
            ready = true;
        end
        maxTries = maxTries - 1;
    end
    
    % throw an error if it wasn't possible to randomize the stim ordering
    if (ready == false)
        error ('could not properly order stims ... Is it possible?');
    end