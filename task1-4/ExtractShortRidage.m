function [result , ShortRidges]= ExtractShortRidage ( image , EndPointList,RidgeLen )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
result = image ; 
[W ,H] = size(image) ;
[~,Wend] = size(EndPointList) ;
ShortRidges =0 ; 
sh = 0;
% result = uint8(ones(W, H, 1));
    for i =3 :Wend
      List =  searchForShortRediges(image , EndPointList(1,i), EndPointList(2,i) ,RidgeLen);
      [ ~ ,WList] = size(List) ;
      if(List(1,1)==0 &&List(2,1)==0)
          continue ; 
      else
          sh = sh+1;
            [ ~ ,len]  = size(ShortRidges);
            [ ~ ,lenList]  = size(List);
            ShortRidges(1, len+1) = List(1,1);
            ShortRidges(2, len+1) = List(2,1);
            ShortRidges(3, len+1) = List(1,lenList);
            ShortRidges(4, len+1) = List(2,lenList);
      end
  
      for j =1 :WList
          result(List(1,j),List(2,j)) = 127;
      end
    end
    disp(sh);
end

