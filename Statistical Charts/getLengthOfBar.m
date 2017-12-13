function [ length ] = getLengthOfBar(objectImage)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
[~ , ~ , MaxY , MinY] = getfourCornersOfRectangle(objectImage);
 
 length = MaxY - MinY ;
%  im = insertMarker(objectImage,[MinY , MinX]) ; 
%   figure, imshow(insertMarker(insertMarker(objectImage,[MinX , MaxY]),[MinX ,MinY]));
 
end

