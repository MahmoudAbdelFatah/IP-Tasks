function [ points ] = getListOfPointObjects(rectImage,colors)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
[h,~] = size(colors); 
points = zeros([h 2]);
    for i=1: h 
     points(i,:) = bestMeanPositionForColor(rectImage , colors(i,:));
    end
end
