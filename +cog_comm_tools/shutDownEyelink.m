% function to shutdown eyelink equipment properly on error conditions
% 
% NOTE: This method should be called in the outter catch for all
% experiments using the Eyelink equipment.
%
%
function shutDownEyelink()
   % is eyelink Equipment Connected?
   if (Eyelink('IsConnected'))
        is Eyelink Equipment Recording? 
       if (Eyelink('CheckRecording'))
           Eyelink('StopRecording');
       end
       Eyelink('ShutDown');
   end
 
end

