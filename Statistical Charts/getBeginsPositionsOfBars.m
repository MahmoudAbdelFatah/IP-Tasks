function [ points ] = getBeginsPositionsOfBars( NumbersOfObjcts )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
points = size([NumbersOfObjcts 2]);
for i=1 :NumbersOfObjcts 
    image = imread(strcat('Object',num2str(i),'.jpg'));
 [MaxX,MinX, MaxY, MinY] = getfourCornersOfRectangle(image);
 
    points(i,1) = MinX;
    points(i,2) = MaxY;
 figure,  imshow(insertMarker(image,[points(i,1), points(i,2)]));
end
x=0 ;
end

