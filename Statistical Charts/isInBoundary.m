function [ bool ] = isInBoundary( i ,j , w , h )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
bool = 0 ; 
 
if( i >= 1 && i <= h && j >= 1 && j <= w ) 
    bool = 1;
end

end

