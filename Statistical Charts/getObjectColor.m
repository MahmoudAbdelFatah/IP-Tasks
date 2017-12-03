function [ color ] = getObjectColor(image , position)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
color = image(position(1),position(2),:) ;
end

