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
      if(InputImage(i,j, 1)>= 230 && InputImage(i,j, 1)<= 255 && InputImage(i,j, 2)>= 160 && InputImage(i,j, 2)<= 210 && InputImage(i,j, 3)>= 0 && InputImage(i,j, 3)<= 20) 
          M = M+1;
      end
      
      if(InputImage(i,j, 1)>= 220 && InputImage(i,j, 1)<= 230 && InputImage(i,j, 2)>= 240 && InputImage(i,j, 2)<= 250 && InputImage(i,j, 3)>= 0 && InputImage(i,j, 3)<= 10) 
          E = E+1;
      end
      
      if(InputImage(i,j, 1)>= 190 && InputImage(i,j, 1)<= 250 && InputImage(i,j, 2)>= 65 && InputImage(i,j, 2)<= 120 && InputImage(i,j, 3)>= 55 && InputImage(i,j, 3)<= 95) 
          V = V+1;
      end
   end
end
img = rgb2gray(InputImage);
if V > E && V > M
    Vendor = 0;
    thresh = 0.87;
    img = imgaussfilt(img,2);
elseif E > V && E > M
    Vendor = 1;
    thresh = 0.9;
    img = imgaussfilt(img,2);
else
    Vendor = 2;
    thresh = 0.8;
img = imgaussfilt(img,1);
end
disp(Vendor);


img = im2bw(img, thresh);
figure, imshow(img);
img = imdilate(img,ones(6,6));
figure, imshow(img);
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

