function [ poistion] = getPositionObject(objectImage)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
pixelList =[0 0];

[h w] = size(objectImage);
% imshow(objectImage);
for i=1:h 
    for j=1:w 
        if(objectImage(i,j)==1 )
            [hi ~] = size(pixelList);
             pixelList(hi+1 ,1)=i ;
             pixelList(hi+1 ,2)=j ;
        end
    end
end
[hi ~] = size(pixelList);
poistion = [pixelList(uint16(ceil(hi/2)) , 1) pixelList(uint16(ceil(hi/2)) , 2) ] ;
end

