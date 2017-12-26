function [ points ] = getPositionsOfBieCharts( NumbersOfObjcts ,OriginImage  ,ratios)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
points = size([NumbersOfObjcts 2]);
BigImage = uint8(zeros(size(imread(strcat('Object',num2str(1),'.jpg')))));
%  // BigImage = rgb2gray(BigImage);
  
for i=1 :NumbersOfObjcts
    
 
    BigImage = imerode(BigImage,ones(9,9));
%       figure, imshow(BigImage);
    image = imread(strcat('Object',num2str(i),'.jpg'));
    BigImage = imadd(BigImage,image);
      outputImage=BigImage;
     outputImage = im2bw(outputImage, 0.2);
     outputImage = ~outputImage ;
%      figure, imshow(outputImage);
     outputImage = imdilate(outputImage,ones(9,9));
     
     BigImage = imdilate(BigImage,ones(9,9));
     
     [objects,num ] =bwlabel(outputImage);
      array = zeros(size(num)) ;
     for j=1:num 
        array(j,:) = length(find(objects==j));
       
     end
      
     [~ ,index ] = max(array);
      array(index)=0 ;
     [~ ,index] = max(array);
     x = uint8(objects==index);
     for t=1:10 
      x = imdilate(x,[0 0 0 0 0 0 0 0 0 ; 
                      0 0 0 0 0 0 0 0 0 ; 
                      1 1 1 1 1 1 1 1 1 ;
                      0 0 0 0 0 0 0 0 0 ; 
                      0 0 0 0 0 0 0 0 0 ]); 
     end
     
      
     d = zeros(size(image));
     d(:,:,1) = uint8(x).*image(:,:,1);
     d(:,:,2) = uint8(x).*image(:,:,2);
     d(:,:,3) = uint8(x).*image(:,:,3); 
%        figure, imshow(d);
   [MaxX , MinX , MaxY , MinY] = getfourCornersOfRectangle(d);
     figure, imshow(OriginImage(MinY:MaxY,MinX:MaxX,:));
      text(0,0,num2str(ratios(i)));
%       d = imdilate
 
%      figure, imshow(outputImage);
%      image = imread(strcat('Object',num2str(i),'.jpg'));
end

end
