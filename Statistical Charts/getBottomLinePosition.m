function [MaxY] = getBottomLinePosition( objectImage )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
[~ ,~,MaxY,~] = getfourCornersOfRectangle(objectImage);
% figure, imshow(insertMarker(objectImage ,[min , MaxY]));
end

