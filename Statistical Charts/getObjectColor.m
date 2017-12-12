function [ color ] = getObjectColor(image , position)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% color = image(position(1),position(2),:) ;
image = uint16(image) ;
color =uint16( zeros([1 1 3])) ; 
% colorMatrix = image(position(1)-1 : position(1)+2 ,position(2)-2 +position(2)+2) ; 
    for i=position(1)-2 : position(1)+2
        for j=position(2)-2 : position(2)+2 
            color(1,1,1) =  color(1,1,1) + image(i,j,1) ;
            color(1,1,2) =  color(1,1,2) + image(i,j,2) ; 
            color(1,1,3) =  color(1,1,3) + image(i,j,3) ; 
        end
    end
    color(1,1,1) = color(1,1,1) /25 ;
    color(1,1,2) = color(1,1,2) /25 ;
    color(1,1,3) = color(1,1,3) /25 ;
    
end
