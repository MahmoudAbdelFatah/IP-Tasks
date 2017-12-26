function [rgbImage ] = getObjectFromTheOrigin( image , rgbImage  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Extract the individual red, green, and blue color channels.
redChannel =uint8(rgbImage(:, :, 1));
greenChannel =uint8( rgbImage(:, :, 1));
blueChannel = uint8(rgbImage(:, :, 1));
% Find pixels that are pure black - black in all 3 channels.
% blackPixels = find(rgbImage~=0) ;

[h,w,~] = size(rgbImage);
for i=1:h 
    for j=1:w
        if(rgbImage(i,j)==1)
        redChannel(i,j,1) = image(i,j,1);
        greenChannel(i,j,1) = image(i,j,2);
        blueChannel(i,j,1) = image(i,j,3);
        end
    end
end
% Recombine separate color channels into a single, true color RGB image.
rgbImage = cat(3, redChannel, greenChannel, blueChannel);
%imshow(rgbImage);
end