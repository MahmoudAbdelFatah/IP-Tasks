function [ MeanColor ] = getPositionMeanColor( position , image)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
[h ,w,~ ] = size(image);
image = uint16(image) ; 
MeanColor =uint16(zeros([1 1 3])) ; 
count =0 ; 
  for i=position(1)-2 : position(1)+2
        for j=position(2)-2 : position(2)+2
            if(isInBoundary(i,j,w,h))
                count = count +1 ;
            MeanColor(1,1,1) =  MeanColor(1,1,1) + image(i,j,1) ;
            MeanColor(1,1,2) =  MeanColor(1,1,2) + image(i,j,2) ; 
            MeanColor(1,1,3) =  MeanColor(1,1,3) + image(i,j,3) ; 
            end
        end
  end
    MeanColor(1,1,1) = MeanColor(1,1,1) /count ;
    MeanColor(1,1,2) = MeanColor(1,1,2) /count ;
    MeanColor(1,1,3) = MeanColor(1,1,3) /count ;
end

