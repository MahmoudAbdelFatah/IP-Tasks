% Preprocessing on Image Date

% imread Example
image=imread('D:\Practical Images\q.jpg');

%% rgb2gray Example
% grayimage=rgb2gray(image);
% subplot(1,2,1);
% imagesc(image);
% title('RGB Image');
 
% subplot(1,2,2);
% imagesc(grayimage);
% colormap(gray);
% title('Grayscale Image');

%% imwrite Example 
% grayimage=rgb2gray(image);
% imwrite(grayimage,'D:\grayimage.jpg');

%% imhist Example
% grayimage=rgb2gray(image); %image should be converted to grayscale to display histogram
% subplot(1,2,1);
% imagesc(grayimage);
% colormap(gray);
% title('Grayscale Image');
% 
% subplot(1,2,2);
% imhist(grayimage);
% title('Histogram');

%% im2bw Example
% level = graythresh(image);
% binaryimage=im2bw(image,level);
% colormap(gray);
% subplot(1,2,1);
% imagesc(image);
% title('RGB Image');
% 
% subplot(1,2,2);
% imagesc(binaryimage);
% title('Binary Image');

%% noise removal Examples
% noiseimage = imnoise(grayimage, 'gaussian'); %Add noise to image
% subplot(1,2,1);
% imshow(noiseimage);
% title('Noisy Image');
% 
% %B = medfilt2(noiseimage);
% B = wiener2(noiseimage,[5 5]);
% subplot(1,2,2);
% imshow(B);
% title('After using Wiener Filter');

%% imresize Example
% %image2=imresize(image,0.5);
% %image2=imresize(image,1.5);
% %image2=imresize(image,[100 100]);
% figure;
% imshow(image);
% title('Original Image');
% 
% figure;
% imshow(image2);
% title('Resized Image');

%% imrotate Example
% image2=imrotate(image,90);
% subplot(1,2,1);
% imshow(image);
% title('Original Image');
% 
% subplot(1,2,2);
% imshow(image2);
% title('Rotated Image by 90');

%% imcrop Example
% image2=imcrop(image,[430 140 230 295]);
% subplot(1,2,1);
% imshow(image);
% title('Original Image');
%  
% subplot(1,2,2);
% imshow(image2);
% title('Cropped Image');
