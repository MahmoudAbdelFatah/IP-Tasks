function [rgbImage] = LabelObject( image , rgbImage  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Extract the individual red, green, and blue color channels.
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);
% Find pixels that are pure black - black in all 3 channels.
blackPixels = redChannel ~= 0 | greenChannel  ~= 0 | blueChannel  ~= 0;
% Make red (255,0,0)
position = getPositionObject(blackPixels) ; 
pixelColor = getObjectColor(image , position);

redChannel(blackPixels) = pixelColor(:,:,1);
greenChannel(blackPixels) = pixelColor(:,:,2);
blueChannel(blackPixels) = pixelColor(:,:,3);
% Recombine separate color channels into a single, true color RGB image.
rgbImage = cat(3, redChannel, greenChannel, blueChannel);
%imshow(rgbImage);
end

