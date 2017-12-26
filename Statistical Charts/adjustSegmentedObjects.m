function  adjustSegmentedObjects(NumberOfObjects,originImage)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
for i=1 :NumberOfObjects
    image = imread(strcat('Object',num2str(i),'.jpg'));
    image = im2bw(image, 0.2);
%      figure, imshow(image);
     image = imdilate(image,ones(7,7));
%      image = uint8(cat(3, image, image, image));
%      imwrite(image,strcat('Object',num2str(i),'.jpg'));
%      image = imread(strcat('Object',num2str(i),'.jpg'));
     image = getObjectFromTheOrigin(originImage , image);
     imwrite(image,strcat('Object',num2str(i),'.jpg'));
%      figure, imshow(image);
end

end

