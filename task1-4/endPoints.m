function [result ,endPointsArray] = endPoints( image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[W ,H] = size(image) ;
result = uint8(ones(W, H, 1));
endPointsArray = [0;0]; 
for i =1:W 
    for j =1:H
        if(isEndPoint(image , i ,j ) ) 
                 endPointsArray(1, length(endPointsArray)+1 ) =i ;
                 endPointsArray(2, length(endPointsArray) ) =j ;
                result(i,j,1) = 127 ;
             else 
                 result(i,j,1) = image(i,j,1);
         end
         
    end
end
%            imagesc([1 W], [1 H], flipud(result));
%                 hold on
%                 plot(plts(1,:),plts(2,:),'b-*','linewidth',1.5);
%                 set(gca,'ydir','normal');
end

  

