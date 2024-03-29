function [ mini, val ] = getUpperLinePosition(I)
%GETUPPERLINEPOSITION Summary of this function goes here
%   Detailed explanation goes here
% take RGB image
% return the min i with longest line 

%   I = imread('3.png');
% imshow(I)
I = rgb2gray(I);
    
imm = I;
h = fspecial('sobel');
I= imfilter(I,h,'replicate');
BW = edge(I,'canny');
% imshow(BW);
[H,theta,rho] = hough(BW);

P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = theta(P(:,2));
y = rho(P(:,1));
% plot(x,y,'s','color','black');
lines = houghlines(BW,theta,rho,P,'FillGap',4,'MinLength',size(I, 2)-(size(I, 2)/3));
figure, imshow(I), hold on
% max_len = 0;
mini = size(I, 1);
xy_long = [0 0 ; 0 0];
for k = 1:length(lines)
     if lines(k).point1(1, 2) > (size(I, 1)/2) ||lines(k).point2(1, 2) > (size(I, 1)/2) 
         continue;
     end
   xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% % 
%    % Plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% 
%    % Determine the endpoints of the longest line segment
%     len = norm(lines(k).point1 - lines(k).point2);
%    if ( len > max_len)
%       max_len = len;
%       xy_long = xy;
%    end
   if ( mini > xy(1, 2))
      mini = xy(1,2);
      xy_long = xy;
   end
end
% highlight the longest line segment
% plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
mm = imm(xy_long(1,2)-10:xy_long(1,2)+10, 1:xy_long(1,1)-2);
imgBW = im2bw(mm, 0.6);
figure, imshow(imgBW);
imgBW = ~imgBW;
%  imgBW = imerode(imgBW,ones(1,1));
%   imgBW = imdilate(imgBW,ones(2,2));
figure, imshow(imgBW);
[L, num] = bwlabel(imgBW);
% iii = int8(zeros([500 500]));

for k = 1 : num
    thisBlob = ismember(L, k);
    
    thisBlob = imresize(thisBlob, [100, 100]);
    
    figure, imshow(thisBlob);
    [numberChar] = RecognizeNumber(thisBlob);
    numberInt = str2double(numberChar);
    if k==1
        val = numberInt;
    else
        val = 10*val + numberInt;
    end

   
end
    disp(val);
end
%%
% ocrResults = ocr(imgBW, 'TextLayout', 'Block');
% words = ocrResults.Words;
% val = str2double(words(1));


%%
%     thisBlob = imdilate(thisBlob, ones(3, 3));
%     thisBlob = imerode(thisBlob, ones(1,1));
%     figure, imshow(thisBlob);
%     objectBoundries = bwboundaries(thisBlob, 'noholes');
%     forierDes = frdescp(cell2mat(objectBoundries(1,1)));
%      forierDes(1)=[];
%       forierDes = forierDes(1:40,:);
%         forierDes = abs(forierDes);
%       sp = ifrdescp(forierDes, 30);
%       iii = int8(zeros([size(thisBlob, 1) size(thisBlob, 2)]));
%     for d=1:size(sp, 1)
%         iii(ceil(sp(d, 1)), ceil(sp(d, 2))+1) = 1;
%     end
%     imshow(iii, [0,1]);
  
   
%     spitial = ifrdescp(forierDes);
%  dis = double(zeros([10 1]));
%   for i=1:10
%       im = imread(strcat('Train\',num2str(i-1),'.jpg'));
%       if size(im, 3) == 3
%         im = rgb2gray(im);
%       end
%       im = im2bw(im);
%       im = ~im;
% %       figure, imshow(im);
%       trainobjectBoundries = bwboundaries(im,'noholes');
%       trainforierDesc = frdescp(cell2mat(trainobjectBoundries(1,1)));
%       trainforierDesc(1)=[];
%       trainforierDesc = abs(trainforierDesc);
%       
%       trainforierDesc = trainforierDesc(1:40,:);
%       dis(i,1) = sqrt(sum((trainforierDesc - forierDes) .* (trainforierDesc - forierDes)));     
%       
%   end
%   [~, ind] = min(dis);
%     disp(ind-1);
    