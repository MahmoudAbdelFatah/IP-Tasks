function result= Gama(I, gama)
%GAMA Summary of this function goes here
%   Detailed explanation goes here
[H, W, L] = size(I) ;
result = uint8(zeros(H, W, L));

for	x=1:H
    for y=1:W
        newVal = double(I(x, y, :)) .^ gama;
       
        result(x, y, :) = mod(newVal, 255);
    end

end

end

