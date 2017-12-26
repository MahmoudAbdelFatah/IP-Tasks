function [img ,hasLegendArea ] = getRect(I)
%GETRECT Summary of this function goes here
%   Detailed explanation goes here

%    I = imread('2.jpg');
%    I = imread('1.png');
% [MaxX , MinX , MaxY , MinY] = getfourCornersOfRectangle(I);
[Ih,Iw,~] = size(I);
hasLegendArea = 0 ;
im = I;
I = rgb2gray(I);
I = imsharpen(I,'Radius',1,'Amount',1.8);
h = fspecial('disk', 1);
I= imfilter(I,h,'circular');

% figure, imshow(I);
% threshold = graythresh(I);
b = im2bw(I);
b = ~b;

% figure, imshow(b);
s = regionprops(b,'BoundingBox', 'solidity');
min = 0.35;
pos = [0 0 0 0];
for i=1:size(s, 1)
    
         if s(i).Solidity < min 
            min = s(i).Solidity;
            pos = s(i).BoundingBox;
 
            img = imcrop(im,pos);
%              figure,  imshow(img);
            [h,w,~] =size(img);
            
                if(double(h)/double(Ih) > 0.6 && double(w)/double(Iw) > 0.5)
                    hasLegendArea = 0 ;
                    min = 0.35;
                end
            end
end
 
img = imcrop(im,pos);
if( min ~= 0.35 )
    hasLegendArea = 1 ;
end
%  img =im(pos(1,1):p
% img = rgb2gray(img);
% img =cat(3, img(:,:,1), img(:,:,2), img(:,:,3));
%  img = img(5:end-5, 5:end-5, 5:end-5);
% figure, imshow(img, [0 255]);
% img = gray2

end

