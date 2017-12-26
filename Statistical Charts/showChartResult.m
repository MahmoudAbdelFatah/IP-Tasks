function  showChartResult( rectImg, points, ratios )
%GETLABELTEXT Summary of this function goes here
%   Detailed explanation goes here

[H, W, ~] = size(rectImg);
[h, ~] = size(points);
 points = [points ratios'];
 if H <W
 for i=1:h
     rectImg = insertText(rectImg,[points(i, 2), 1],num2str(points(i, 3)),'AnchorPoint','LeftTop');
%       figure, imshow(rectImg);
 end
 else
  for i=1:h
     rectImg = insertText(rectImg,[1, points(i, 1)],num2str(points(i, 3)),'AnchorPoint','LeftTop');
%       figure, imshow(rectImg);
  end
 end
 figure, imshow(rectImg);
 
 
%  imgs = cell(h, 1);
% 
% if H > W
%    result = double(zeros([1 W, 3]));
%     points = sortrows(points, 1);
%   
%     points = [points; H 0 0];
%     
%     for i=1:h
%          
%         if i==1
%             start = 1.0;
%             finish = double(points(i+1, 1) + points(i, 1))/2;
%         else
%             start = double(points(i, 1) + points(i-1, 1))/2;
%             finish = double(points(i+1, 1) + points(i, 1))/2;
%         end
%        
%         r = rectImg(:,:,1);
%         g = rectImg(:,:,2);
%         b = rectImg(:,:,3);
%         r = r(start:finish, :);
%         g = g(start:finish, :);
%         b = b(start:finish, :);
% 
%         img = cat(3, r, g, b);
%          subplot(1,2,h), imshow(img);
% %         imgs{h} = img; 
% %         imshow(img);
%        text(0,0,num2str(points(i, 3)))
%     end
% else
%     result = double(zeros(H, 1, 3));
%     points = sortrows(points, 2);
%     points = [points; 0 W 0];
%     for i=1:h
%         
%         if i==1
%             start  = 1.0;
%             finish = double(points(i+1, 2)) - 5.0;
%         else
%             start  = double(points(i, 2));
%             finish = double(points(i+1, 2)) - 5.0;
%         end
%         r = rectImg(:,:,1);
%         g = rectImg(:,:,2);
%         b = rectImg(:,:,3);
%         r = r(:, start:finish);
%         g = g(:, start:finish);
%         b = b(:, start:finish);
% 
%         img = cat(3, r, g, b);
% %        img = rectImg(points(i, 1)-10:end, points(i, 2)-5:points(i+1, 2)-5, :);
% %         imshow(img)
% %         imgs{h} = img;
%         
%         RGB = insertText(img,[1 1],num2str(points(i, 3)),'AnchorPoint','LeftBottom');
% %        text(0,0,num2str(points(i, 3)))
%     end
% figure, imshow(result, [0, 255]);



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

