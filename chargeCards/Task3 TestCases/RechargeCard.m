function [Vendor, RegionOfNumbers] = RechargeCard(InputImage)
%RECHARGECARD Summary of this function goes here
%   Detailed explanation goes here
figure, imshow(InputImage);
[H, W, ~] = size(InputImage);
M = 0;
E = 0;
V = 0;
thresh = 0.0;

for i=1:H
   for j=1:W
      if(InputImage(i,j, 1)>= 130 && InputImage(i,j, 1)<= 255 && InputImage(i,j, 2)>= 90 && InputImage(i,j, 2)<= 150 && InputImage(i,j, 3)>= 0 && InputImage(i,j, 3)<= 70) 
          M = M+1;
      end
      
      if(InputImage(i,j, 1)>= 150 && InputImage(i,j, 1)<= 230 && InputImage(i,j, 2)>= 150 && InputImage(i,j, 2)<= 250 && InputImage(i,j, 3)>= 10 && InputImage(i,j, 3)<= 30) 
          E = E+1;
      end
      
      if(InputImage(i,j, 1)>= 130 && InputImage(i,j, 1)<= 250 && InputImage(i,j, 2)>= 50 && InputImage(i,j, 2)<= 120 && InputImage(i,j, 3)>= 40 && InputImage(i,j, 3)<= 95) 
          V = V+1;
      end
   end
end
% img = InputImage;
%  InputImage = InputImage+20;
 img = rgb2gray(InputImage);
if V > E && V > M
    Vendor = 'vodafone';
    img = imgaussfilt(img,2);
elseif E > V && E > M
    Vendor = 'etisalat';
    img = imgaussfilt(img,3);
else
    Vendor = 'mobinil';
img = imgaussfilt(img,2);
end
disp(Vendor);
% r = img(:, :, 1);
% g = img(:, :, 2);
% b = img(:, :, 3);
% figure, imhist(r);
% figure, imhist(g);
% figure, imhist(b);
figure, imshow(img);
% figure, imhist(img);
count = 0.2;
for i=1:15
    bb = im2bw(img, count);
%     figure, imshow(bb);
        b = length(find(bb==0));
    count = count + 0.05;
    if b > 0.50*size(bb, 1)*size(bb, 2)
       thresh =  count;
       break;
    end
end

% figure, imshow(img);
img = im2bw(img, thresh);
%   img = ~img;
% figure, imshow(img);
img = imdilate(img,ones(6,6));
% figure, imshow(img);
[L, num] = bwlabel(img);
disp(num);
count = uint32(zeros([num 2]));
for i=1:H
    for j=1:W
        if L(i, j) ~= 0
             count(L(i,j), 1) = count(L(i,j), 1) + 1;
             count(L(i,j), 2) = L(i,j);
        end
    end
end
count = sortrows(count, 1);
[h,~] = size(count);
objnum = 1;
for i=1:(h/2)
    tmp = count(i, :);
    count(i, :) = count(h-i+1, :);
    count(h-i+1, :) = tmp; 
end
if h >1
    objnum = count(2,2);
end
minx = H;
miny = W;
maxx = 0;
maxy = 0;
for i=1:H
    for j=1:W
       if objnum == L(i, j)
           if i < minx
               minx = i;
           end
           if i > maxx
               maxx = i;
           end
           if j < miny
               miny = j;
           end
           if j > maxy
               maxy = j;
           end
       end
    end
end
RegionOfNumbers = InputImage(minx:maxx, miny:maxy, :);
figure, imshow(RegionOfNumbers);
end

