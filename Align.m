function [ AlignedImage, Corners ] = Align( InputImage, DW, DH )
%ALIGN Summary of this function goes here
%   Detailed explanation goes here
% [H, W, L] = size(InputImage);
% P1 = [70 335 280 12; 16 133 280 167];
% for x=1:H
%     for y=1:W
%         if InputImage(x,y, 1)>0 && InputImage(x+1,y, 2)>0
%             P1(1,1) = x;
%             P1(2,1) = y;
%         elseif InputImage(x,y, 1)>0
%             
%     end
% end
P1 = [70 335 280 12; 16 133 280 167];
P2 = [1 DH DH 1; 1 1 DW DW];
AlignedImage = Warp(InputImage, P1, P2);
Corners = P1;
end

