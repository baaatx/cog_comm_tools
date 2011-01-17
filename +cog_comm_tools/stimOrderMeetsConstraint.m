% A function that checks to see if a stim Ordering meets criteria based on 
% maxInOrder (max number of valid or invalid stims to appear in a row). 
%
% Note: This function will continue to randomize until the constraint is
% met (make sure it is possible).
%
% Note: You may want to use this as a template to write your own custom
% randomization functions based on a custom constraints.
%
%
% stimMap - containser.Map() of stim objects
%
% orderList - cell Array of stim key codes
%
% maxInOrder - (optional) the max number of invalid (or valid) stim objects that can
% appear in a row.
%
% lastStimCode - (optional) the last stim (in the last trial) that was used... Used to
% prevent the first stim from being the same as lastStimCode...
%
%
% Author: Brian Armstrong
%
function meetsConstraint = stimOrderMeetsConstraint(stimMap, orderList, maxInOrder, lastStimCode)

    % lastStimCode is optional
    if (nargin < 4)
        lastStimCode = '';
    end

    % make maxInOrder optional, and default to 3
    if (nargin < 3)
        maxInOrder = 3;
    end
    
    maxInvalidInOrder = 0;
    invalidInOrder = 0;
    
    maxValidInOrder = 0;
    validInOrder = 0;

    meetsConstraint = false;
    
    for i=1:length(orderList)
        % if the same stim appears back to back, ordering is invalid so
        % return...
        if ( i>1 && strcmp(orderList{i},orderList{i-1}))
            return;
        end

        % if the lastStimCode is equal to the first stim code, this
        % ordering is invalid (back to back stims...)
        
        if ( i==1 && strcmp(orderList{1},lastStimCode))
            return;
        end
        
        stim = stimMap(orderList{i});
        
        if (stim.valid)
            invalidInOrder = 0;
            validInOrder = validInOrder + 1;
            maxValidInOrder = max (maxValidInOrder, validInOrder);
        elseif (~stim.valid)
            validInOrder = 0;
            invalidInOrder = invalidInOrder + 1;
            maxInvalidInOrder = max (maxInvalidInOrder, invalidInOrder);
        end
    end
    
    if (maxInvalidInOrder <= maxInOrder && maxValidInOrder <= maxInOrder)
        meetsConstraint = true;
    end