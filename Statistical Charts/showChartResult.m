function [ output_args ] = showChartResult( rectImg, points, ratios )
%GETLABELTEXT Summary of this function goes here
%   Detailed explanation goes here

[H, W] = size(rectImg);
[h, ~] = size(points);
if H > W
    points = sortrows(points, 1);
    plus = uint8(H/(h+4));
    points = [points; H 0];
    
    for i=1:h
        x = points(i, 1)-plus ;
        if x<=0
            x = 1;
        end
        if i==h
            plus =0;
        end
       img = rectImg(x:points(i+1, 1)-plus, points(i, 2)-10:end, :);
       figure, imshow(img, [0 255])
       text(0,0,num2str(ratios(1, i)))
    end
else
    points = sortrows(points, 2);
    points = [points; 0 W];
    for i=1:h
       img = rectImg(points(i, 1)-10:end, points(i, 2)-5:points(i+1, 2)-5, :);
       imshow(img, [0 255])
       text(0,0,num2str(ratios(i, 1)))
    end
end




% b = im2bw(img);
% imshow(b);
% b = ~b;
% se = strel('line',7,0);
% bw2 = imdilate(b,se);
% bw2 = imdilate(b,ones(5,5));
% imshow(bw2)
% i = imread('2.jpg');
% m = getRect(i);
% m = imsharpen(m,'Radius',1,'Amount',0.6);
% imgBW = im2bw(m, 0.1);
% imshow(imgBW);
% imgBW = ~imgBW;
%   bw2 = imerode(imgBW, ones(1,1));
%   imshow(bw2);
% bw2 = imdilate(bw2,ones(8,8));
% imshow(bw2);
%  ocrResults= ocr(bw2);
% imshow(bw2);
% fun = @(x) median(x(:));
% B = nlfilter(bw2,[3 3],fun);
% imshow(B);
end

