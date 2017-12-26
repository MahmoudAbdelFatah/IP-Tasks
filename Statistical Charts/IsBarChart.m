function [ bool ] = IsBarChart(objectImage )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
bool = false ; 
[maxx, minx,maxy,miny] = getfourCornersOfRectangle(objectImage);
Area = getRectArea(maxx,minx ,maxy,miny);
NumbersOfpixelAtTheObject =  getNumberOfPixel(objectImage);
ratio = double (double(NumbersOfpixelAtTheObject ) / double(Area));

if( ratio > 0.8 )
    bool = true ; 
end
% figure, imshow(insertMarker(insertMarker(insertMarker(insertMarker(objectImage ,[maxx , miny]) ,[minx , miny]) ,[maxx , maxy]) ,[minx , maxy]));

end

