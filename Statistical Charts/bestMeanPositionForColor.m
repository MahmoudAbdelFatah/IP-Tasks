function [bestPosition] = bestMeanPositionForColor(rectImage , mean)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
[h,w]= size(rectImage) ;
bestDistance = intmax('int64') ; 
bestMean = 0 ; 
bestPosition = [0 0] ;  
for i=1 : h 
   for j=1 : w 
    positionMean = getPositionMeanColor([i j],rectImage);
    distance = getDistance(mean,[positionMean(1,1,1) positionMean(1,1,2) positionMean(1,1,3)]); 
    if(distance < bestDistance)
       bestPosition = [i j]; 
       bestMean = positionMean ; 
       bestDistance = distance;
    end
   end
end
    
  figure, imshow(insertMarker(rectImage,bestPosition));
end

