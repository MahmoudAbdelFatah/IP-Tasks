function [ length ,MaxValue ] = getLengthOfMaxBarValue(objectImage,image)
%UNTITLED16 Summary of this function goes here
%   Detailed explanation goes here
  MaxY = getBottomLinePosition(objectImage);
  [MinY,MaxValue] = getUpperLinePosition(image);
   length = abs(MaxY - MinY) ;
end

