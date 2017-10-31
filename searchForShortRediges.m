function [result] = searchForShortRediges(image , i, j , RidgeLen )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

img = image;
result = [i;j] ;
image(i,j)= 127; 

while (true) 
             
    if (RidgeLen < 0)
        result = [0;0] ; 
        break ; 
    end
             [ ~ ,len ]  = size(result);
                % i-1 , j 
              if(image(i-1,j,1)==0)
                 
                result(1, len+1) = i-1 ;
                result(2, len+1) = j ;
                image(i-1,j,1)=127 ;
                 
                i = i-1 ;
                      
              % i , j+1
              elseif(image(i , j+1,1)==0 )
                   
                result(1,len+1 ) = i ;
                result(2,len+1) = j+1 ;
                image(i , j+1,1)= 127 ;
                 
                 j =j+1 ;
             % i,j-1
              elseif(image(i,j-1,1)==0 )
                  result(1,len+1) = i  ;
                result(2, len+1) = j-1 ;
                image(i,j-1,1)=127 ;  
                j = j-1 ;
               
              % i+1,j
             elseif(image(i+1,j,1)==0  )
                  
               result(1,len+1) = i+1 ;
               result(2, len+1 ) = j ;
               image(i+1,j,1)=127 ;
                i = i+1 ;
             % i+1 ,j+1
              elseif(image(i+1 ,j+1,1)==0 )
                    result(1,len+1) = i+1 ;
                result(2, len+1 ) = j +1;
                image(i+1 ,j+1,1)=127 ;
                i = i+1 ;
                j = j+1 ;
                  
                % i-1, j-1 
             elseif(image(i-1,j-1)==0 )
                 
                 result(1,len+1) = i-1 ;
                result(2, len+1) = j-1 ;
                 image(i-1,j-1)= 127 ;
                i = i-1 ;
              j=j-1 ;
              %i+1,j-1
              elseif(image(i+1,j-1,1)==0  )
                result(1, len+1) = i+1 ;
                result(2,len+1 ) = j-1 ;
                image(i+1,j-1,1)=127 ;
                j = j-1 ;
                i =i+1 ;
               
               % i-1 ,j+1
             elseif(image(i-1 ,j+1,1)==0  )
                 result(1, len+1 ) = i-1 ;
                result(2, len+1 ) = j+1 ;
                image(i-1 ,j+1,1)=127;
                i = i-1 ;
                j=j+1 ;
             end
              RidgeLen = RidgeLen - 1 ; 
              % endpoint 
              if(isEndPoint(img,i,j))
                 return          
              end
              
end








%      visited(i,j) = 1 ;
%             % i-1, j-1 
%              if(image(i-1, j-1,1)== 0 )
%                   if(isEndPoint(image ,i-1, j-1))
%                        result(i-1,j-1) = 127 ;
%                        isShortRidge = true ; 
%                        v_visited(i-1,j-1)= 1 ; 
%                        return 
%                   end
%               [result , isShortRidge, v_visited ] = searchForShortRediges(image , visited ,i-1, j-1 );
%              end
%              % i-1 , j 
%               if(image(i-1,j,1)==0  )
%                       if(isEndPoint(image ,i-1,j))
%                        result(i-1,j) = 127 ;
%                        isShortRidge = true ; 
%                        v_visited(i-1,j)= 1 ; 
%                        return 
%                       end
%            
%               [result , isShortRidge, v_visited ] = searchForShortRediges(image , visited ,i-1,j );
%               end
%               % i-1 ,j+1
%              if(image(i-1 ,j+1,1)==0 )
%                     if(isEndPoint(image ,i-1 ,j+1))
%                        result(i-1 ,j+1) = 127 ;
%                        isShortRidge = true ; 
%                        v_visited(i-1 ,j+1)= 1 ; 
%                        return 
%                     end
%            
%               [result , isShortRidge, v_visited ] = searchForShortRediges(image , visited ,i-1 ,j+1);  
%              end
%              % i,j-1
%               if(image(i,j-1,1)==0  )
%                       if(isEndPoint(image ,i,j-1))
%                        result(i,j-1) = 127 ;
%                        isShortRidge = true ; 
%                        v_visited(i,j-1)= 1 ; 
%                        return 
%                       end
%            
%               [result , isShortRidge, v_visited ] = searchForShortRediges(image , visited ,i,j-1 );
%               end
%               % i , j+1
%              if(image(i , j+1,1)==0 )
%                     if(isEndPoint(image ,i , j+1))
%                        result(i , j+1) = 127 ;
%                        isShortRidge = true ; 
%                        v_visited(i , j+1)= 1 ; 
%                        return 
%                     end
%            
%               [result , isShortRidge, v_visited ] = searchForShortRediges(image , visited ,i , j+1 );
%              end
%              %i+1,j-1
%               if(image(i+1,j-1,1)==0 )
%                      if(isEndPoint(image ,i+1,j-1))
%                        result(i+1,j-1) = 127 ;
%                        isShortRidge = true ; 
%                        v_visited(i+1,j-1)= 1 ; 
%                        return 
%                      end
%            
%               [result , isShortRidge, v_visited ] = searchForShortRediges(image , visited ,i+1,j-1 );
%               end
%               % i+1,j
%              if(image(i+1,j,1)==0 )
%                     if(isEndPoint(image ,i+1,j))
%                        result(i+1,j) = 127 ;
%                        isShortRidge = true ; 
%                        v_visited(i+1,j)= 1 ; 
%                        return 
%                     end
%            
%               [result , isShortRidge, v_visited ] = searchForShortRediges(image , visited ,i+1,j );
%              end
%              % i+1 ,j+1
%               if(image(i+1 ,j+1,1)==0)
%                       if(isEndPoint(image ,i+1 ,j+1))
%                        result(i+1 ,j+1) = 127 ;
%                        isShortRidge = true ; 
%                        v_visited(i+1 ,j+1)= 1 ; 
%                        return 
%                       end
%            
%               [result , isShortRidge, v_visited ] = searchForShortRediges(image , visited ,i+1 ,j+1);
%               end  
%               
 
end

