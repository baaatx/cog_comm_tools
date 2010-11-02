% Checks to see if a stim Ordering meets criteria based on maxInOrder (max
% number of valid or invalid stims to appear in a row)
%
% stimMap - containser.Map() of stim objects
%
% orderList - cell Array of stim key codes
%
% Author: Brian Armstrong
%
function meetsConstraint = stimOrderMeetsConstraint(stimMap, orderList, maxInOrder)
    
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