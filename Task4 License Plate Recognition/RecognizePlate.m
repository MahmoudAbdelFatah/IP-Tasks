function [Digits] = RecognizePlate(InputImage)

img2 = rgb2gray(InputImage);
imshow(img2);

edgesOnX = edge(img2,'sobel','horizontal');
edgesOnY = edge(img2,'sobel','vertical');
img3 = edgesOnX|edgesOnY;
imshow(img3);

se = strel('line',2,90);
img3 = imdilate(img3,se);
imshow(img3);

se = strel('line',1,0);
img3 = imdilate(img3,se);
imshow(img3);

%Remove small objects from binary image
img3 = bwareaopen(img3, 700);
imshow(img3);

img4 = imfill(img3,'holes');
imshow(img4);


img5 = immultiply(img2,img4);
imshow(img5);

imshow(img5);
img5 = ~im2bw(img5);
imshow(img5);

%Remove small objects from binary image
img5 = bwareaopen(img5,4000);
imshow(img5);
img5 = ~img5;
imshow(img5);
img5 = bwareaopen(img5,4000);
imshow(img5);

img5 = ~img5;
imshow(img5);
imgProp = regionprops(img5,'BoundingBox','Image');

im1=im2bw(imresize(imread('1.bmp'),[40,20]), 0.5);
im3=im2bw(imresize(imread('3.bmp'),[40,20]), 0.5);
im4=im2bw(imresize(imread('4.bmp'),[40,20]), 0.5);
im6=im2bw(imresize(imread('6.bmp'),[40,20]), 0.5);
im7=im2bw(imresize(imread('7.bmp'),[40,20]), 0.5);
im8=im2bw(imresize(imread('8.bmp'),[40,20]), 0.5);
im9=im2bw(imresize(imread('9.bmp'),[40,20]), 0.5);

im=im2bw(imresize(imread('cmr.PNG'),[40,20]), 0.5);


cnt=0;
Digits='';
endSize = size(imgProp);
for i = 1 : endSize
    this = imgProp(i).BoundingBox;
    imshow(~imgProp(i).Image);
    if(this(3)>=2 &&this(4)>=30 && this(3)<=100 &&this(4)<=300)
        temp = ~imgProp(i).Image; 
        imshow(temp);
        temp=imresize(temp,[40,20]);
        imshow(temp);
        imwrite(temp,'temp.bmp');
        imgTest =imread('temp.bmp');
        img = imabsdiff(im,imgTest);
        imshow(im);
        imshow(img);
        imshow(imgTest);
        rectangle('position',this,'EdgeColor','r');
        minDiff = sum(img(:));
        cnt=cnt+1;
    if cnt==1 || cnt==2 || cnt==3
        imshow(img);
        imshow(imgTest);
        
        img = imabsdiff(im1,imgTest);
        imshow(img);
        if(sum(img(:))<minDiff)
        minDiff= sum(img(:));
        ch='1';
        end
        
        img = imabsdiff(im3,imgTest);
        if(sum(img(:))<minDiff)
        minDiff= sum(img(:));
        ch='3';
        end
        
        img = imabsdiff(im4,imgTest);
        if(sum(img(:))<minDiff)
        minDiff= sum(img(:));
        ch='4';
        end
        
        img = imabsdiff(im6,imgTest);
        if(sum(img(:))<minDiff)
        minDiff= sum(img(:));
        ch='6';
        end
        
        img = imabsdiff(im7,imgTest);
        if(sum(img(:))<minDiff)
        minDiff= sum(img(:));
        ch='7';
        end
        
        img = imabsdiff(im8,imgTest);
        if(sum(img(:))<minDiff)
        minDiff= sum(img(:));
        ch='8';
        end
        
        img = imabsdiff(im9,imgTest);
        if(sum(img(:))<minDiff)
        minDiff= sum(img(:));
        ch='9';
        end
        
        Digits=strcat(Digits,ch);
    end
        
   end
end
msgbox(strcat('the numbers on the plate : ',Digits));

end

