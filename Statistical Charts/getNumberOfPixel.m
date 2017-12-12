function [ numberOfpixels ] = getNumberOfPixel( image)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
redChannel = image(:, :, 1);
greenChannel = image(:, :, 2);
blueChannel = image(:, :, 3);
% Find pixels that are pure black - black in all 3 channels.
NotblackPixels = redChannel ~= 0 | greenChannel  ~= 0 | blueChannel  ~= 0;
numberOfpixels = sum(sum(NotblackPixels));
end

