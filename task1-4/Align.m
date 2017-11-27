function [AlignedImage, Corners] = Align(InputImage, DW, DH)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[H, W, L] = size(InputImage);
colorCorners= ones(2,4);
Corners= [DH 1 1 DH; 1 1 DW DW];
for Y=1:H
    for X=1:W
        if(InputImage(Y,X,2)==240)&&(InputImage(Y,X,1)<10)&&(InputImage(Y,X,3)<10)%1>>green
            colorCorners(1,1)=Y;
            colorCorners(2,1)=X;
        elseif(InputImage(Y,X,2)==255)&&(InputImage(Y,X,1)<10)&&(InputImage(Y,X,3)<10)%>>green and red
            colorCorners(1,2)=Y;
            colorCorners(2,2)=X;
        elseif(InputImage(Y,X,1)==224)&&(InputImage(Y,X,2)<10)&&(InputImage(Y,X,3)<10)%>>red
            colorCorners(1,3)=Y;
            colorCorners(2,3)=X;
        elseif(InputImage(Y,X,3)==230)&&(InputImage(Y,X,1)<10)&&(InputImage(Y,X,2)<10)%>>blue
            colorCorners(1,4)=Y;
            colorCorners(2,4)=X;
        end
        
    end
end

InputImage = Warp(InputImage, colorCorners,Corners);
x=0;y=0;
[H, W, L] = size(InputImage);
for Y=1:H
 for X=1:W
     if(InputImage(Y,X,2)==255)&&(InputImage(Y,X,1)<10)&&(InputImage(Y,X,3)<10)
         x=X;
         y=Y;
     end
 end
end
AlignedImage= imcrop(InputImage,[x y DW DH]);
disp(colorCorners);
end