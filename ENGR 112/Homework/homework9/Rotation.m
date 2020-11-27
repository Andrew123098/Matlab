function [mRot] = Rotation(theta)
%ROTATION creates a rotation matrix given an angle of ratation
%Define given variables and rotation matrix
mRot=eye(3); %identity matrix
mRot(1,1)=cosd(theta); %make rotation matrix
mRot(1,2)=sind(theta); %make rotation matrix
mRot(2,1)=-sind(theta); %make rotation matrix
mRot(2,2)=cosd(theta); %make rotation matrix
end

