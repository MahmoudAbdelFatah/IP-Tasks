function [segmentedimage] = Edgebased(image, GrayImage)

objectNumber = 1 ;
%1) Read Image
%2) Convert loaded image to grayscale image
%3) Edge Detection
A = image ;
BW = edge(GrayImage,'Canny');
    
%4) Dilate Image
BW = imdilate(BW,ones(5,5));

BW = ~BW;
 
[Labels no_objects] = bwlabel(BW); %Integer labels starting from 0
% segmentedimage = label2rgb(Labels);
 

% Display objects
[h w] = size(image);
smallRatio = h*w*0.002;
for i=2:no_objects
    x = uint8(Labels==i);
    f = sum(sum(x==1));
     if(f < smallRatio) % to neglect small regions
         continue;
     end
    d = zeros(size(image));
    d(:,:,1) = uint8(x).*image(:,:,1);
    d(:,:,2) = uint8(x).*image(:,:,2);
    d(:,:,3) = uint8(x).*image(:,:,3); 
    
    name = strcat('Object',num2str(objectNumber),'.jpg');
    objectNumber = objectNumber + 1 ; 
    
    Out = LabelObject(image,uint8( d) );  
    imwrite(Out,name) ;
end

end

