function result = isEndPoint( image , i ,j )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
 var =0 ;
        % i , j 
        if(image(i,j,1)== 0 )
            % i-1, j-1 
             if(image(i-1, j-1,1)==0 )
                  var = var +1 ; 
             end
             % i-1 , j 
              if(image(i-1,j,1)==0  )
                    var = var +1 ; 
              end
              % i-1 ,j+1
             if(image(i-1 ,j+1,1)==0 )
                    var = var +1 ; 
             end
             % i,j-1
              if(image(i,j-1,1)==0  )
                    var = var +1 ; 
              end
              % i , j+1
             if(image(i , j+1,1)==0 )
                    var = var +1 ; 
             end
             %i+1,j-1
              if(image(i+1,j-1,1)==0 )
                   var = var +1 ; 
              end
              % i+1,j
             if(image(i+1,j,1)==0 )
                   var = var +1 ; 
             end
             % i+1 ,j+1
              if(image(i+1 ,j+1,1)==0)
                    var = var +1 ; 
              end       
        end
        
        if(var==1) 
            result = true ; 
        else 
            result = false ; 
        end

end

