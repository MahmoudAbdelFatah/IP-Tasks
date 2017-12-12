function [ mini ] = getUpperLinePosition(I)
%GETUPPERLINEPOSITION Summary of this function goes here
%   Detailed explanation goes here
% take RGB image
% return the min i with longest line 

%   I = imread('1.png');
% imshow(I)
I = rgb2gray(I);
h = fspecial('sobel');
I= imfilter(I,h,'replicate');
BW = edge(I,'canny');
% imshow(BW);
[H,theta,rho] = hough(BW);

P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = theta(P(:,2));
y = rho(P(:,1));
% plot(x,y,'s','color','black');
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',200);
% figure, imshow(I), hold on
max_len = 0;
xy_long = [0 0 ; 0 0];
for k = 1:length(lines)
     if lines(k).point1(1, 2) > (size(I, 1)/2) ||lines(k).point2(1, 2) > (size(I, 1)/2) 
         continue;
     end
   xy = [lines(k).point1; lines(k).point2];
%     plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% % 
% %    % Plot beginnings and ends of lines
%     plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%     plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% 
%    % Determine the endpoints of the longest line segment
    len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
% highlight the longest line segment
% plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
mini = xy_long(1, 2);
end

