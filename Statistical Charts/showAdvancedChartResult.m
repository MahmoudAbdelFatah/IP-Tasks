function showAdvancedChartResult(image ,points ,ratios )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[h, w ,~ ]= size(image);
for i=1 : size(points,1)
%        image =insertMarker(image,[points(i,1)+5, points(i,2)+5]);
%         insertText here 
     image = insertText(image,[points(i,1), points(i,2)],num2str(ratios( i)),'AnchorPoint','LeftTop');
%       figure, imshow(rectImg);

end
croppedImage =image(points(1,2)-10:end,points(1,1):end,:);
figure , imshow(croppedImage);
end

