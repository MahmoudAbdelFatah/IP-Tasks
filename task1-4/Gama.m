function result= Gama(I, gama)
%GAMA Summary of this function goes here
%   Detailed explanation goes here
[H, W, L] = size(I) ;
result = uint16(zeros(H, W, L));
result = double(result);

result = double(I) .^ gama;
result = Contrast(result, 0, 255);
end

