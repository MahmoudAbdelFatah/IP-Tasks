function result= Gama(I, gama)
%GAMA Summary of this function goes here
%   Detailed explanation goes here
[H, W, L] = size(I) ;
result = uint16(zeros(H, W, L));
result = double(result);

for	x=1:H
    for y=1:W
        result(x, y, :) = double(I(x, y, :)) ^ gama;
    end

end
result = Contrast(result, 0, 255);
end

