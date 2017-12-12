function [maxy] = getBottomLinePosition( objectImage )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
[~,~,maxy,~] = getfourCornersOfRectangle(objectImage);

end

