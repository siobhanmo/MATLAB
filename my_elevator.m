function [elevator] = my_elevator(location_caller,location_one, destination_one, location_two, destination_two)
% location_caller (scalar double) is an integer of the ?oor where the caller is located.
% location_one (scalar double) is an integer that represents location of elevator 1 
% destination_one (scalar double) has value NaN/intger (of floor elevator is approaching) if elevator 1 is not moving/moving
%If elevator 1 is moving, then you can assume that its current location and its destination are di?erent.
% location_two is similar to location_one but for elevator 2 instead of elevator 1. 
% destination_two is for elevator 2 instead of elevator 1. 
% elevator (scalar double):  1 for elevator 1, 2 for elevator 2
dest1 = sqrt(location_caller^2 - destination_one^2);
dest2 = sqrt(location_caller^2 - destination_two^2);
dist1 = sqrt(location_caller^2 - location_one^2);
dist2 = sqrt(location_caller^2 - location_two^2);
    if isequal(location_caller, location_one) && ~isequal(location_caller, location_two)
        elevator = 1;
    elseif isequal(location_caller, location_two) && ~isequal(location_caller, location_one)
        elevator = 2;
    elseif ((location_caller > location_one && location_caller <= destination_one) || (location_caller < location_one && location_caller >= destination_one)) && ~((location_caller > location_two && location_caller <= destination_two) || (location_caller < location_two && location_caller >= destination_two))
        elevator = 1;
    elseif ((location_caller > location_two && location_caller <= destination_two) || (location_caller < location_two && location_caller >= destination_two)) && ~((location_caller > location_one && location_caller <= destination_one) || (location_caller < location_one && location_caller >= destination_one))
        elevator = 2;
    elseif isequal(destination_one, NaN) && ~isequal(destination_two, NaN)
        elevator = 1;
    elseif isequal(destination_two, NaN) && ~isequal(destination_one, NaN)
        elevator = 2;
    elseif dest1 < dest2
        elevator = 1;
    elseif dest2 < dest1
        elevator = 2;
    elseif dist1 < dist2
        elevator = 1;
    elseif dist2 < dist1
        elevator = 2;
    else
        elevator = 1;
    end
end