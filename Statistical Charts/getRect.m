function [ img ] = getRect(I)
%GETRECT Summary of this function goes here
%   Detailed explanation goes here

%    I = imread('2.jpg');
%    I = imread('1.png');
I = rgb2gray(I);
I = imsharpen(I,'Radius',1,'Amount',1.8);
h = fspecial('disk', 1);
I= imfilter(I,h,'circular');

figure, imshow(I);
% threshold = graythresh(I);
b = im2bw(I);
b = ~b;

figure, imshow(b);
s = regionprops(b,'BoundingBox', 'solidity');
min = 1;
pos = [0 0 0 0];
for i=1:size(s, 1)
        if s(i).Solidity < min
            min = s(i).Solidity;
            pos = s(i).BoundingBox;
        end
end
img = imcrop(I, pos);
figure, imshow(img);
end

