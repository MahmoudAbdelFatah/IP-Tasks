function [MaxX , MinX , MaxY , MinY] = getfourCornersOfRectangle(image)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[h w ~] = size(image) ;
MaxX = 1 ; 
MaxY = 1 ; 
MinX = w ; 
MinY = h ; 

for i=1 :h 
    for j=1: w 
      if(image(i,j)~= 0 )
%           image(i,j) = 255 ; 
          if(j > MaxX )
              MaxX = j ;
          end
          if(j < MinX )
              MinX = j ; 
          end
          if(i > MaxY )
              MaxY = i ; 
          end
          if(i < MinY )
             MinY = i ; 
          end
      end
    end
end
image(MinX , MinY )= 255 ;
image(MinX -1  , MinY-1 )= 255 ;
image(MinX -1, MinY+1 )= 255 ;
image(MinX , MinY+1 )= 255 ;
image(MinX+1 , MinY+1 )= 255 ;
image(MinX+1 , MinY )= 255 ;
image(MaxX , MinY )= 255 ;  
image(MinX , MaxY )= 255 ;  
image(MaxX , MaxY )= 255 ;  
imwrite(image ,'corners.jpg'); 

end

