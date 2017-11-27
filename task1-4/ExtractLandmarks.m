function[Endpoints, ShortRidges] = ExtractLandmarks(Image,RidgeLen)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[~, Endpoints] = endPoints(Image) ;
[R, ShortRidges] = ExtractShortRidage(Image,Endpoints,RidgeLen);
result = gray2rgb(Image); 
[~, W, ~] = size(Endpoints);
for i =3 : W
    % point
     result(Endpoints(1, i), Endpoints(2, i) ,1) =255; 
     result(Endpoints(1, i), Endpoints(2, i) ,2) =0; 
     result(Endpoints(1, i), Endpoints(2, i) ,3) =0; 
     %above
     result(Endpoints(1, i)-1, Endpoints(2, i) ,1) =255; 
     result(Endpoints(1, i)-1, Endpoints(2, i) ,2) =0; 
     result(Endpoints(1, i)-1, Endpoints(2, i) ,3) =0; 
     %bottom
     result(Endpoints(1, i)+1, Endpoints(2, i) ,1) =255; 
     result(Endpoints(1, i)+1, Endpoints(2, i) ,2) =0; 
     result(Endpoints(1, i)+1, Endpoints(2, i) ,3) =0; 
     %right
     result(Endpoints(1, i), Endpoints(2, i)+1 ,1) =255; 
     result(Endpoints(1, i), Endpoints(2, i)+1 ,2) =0; 
     result(Endpoints(1, i), Endpoints(2, i)+1 ,3) =0; 
     %left
     result(Endpoints(1, i), Endpoints(2, i)-1 ,1) =255; 
     result(Endpoints(1, i), Endpoints(2, i)-1 ,2) =0; 
     result(Endpoints(1, i), Endpoints(2, i)-1 ,3) =0; 
end
[H, W, ~] = size(R);
for x=1:H
    for y=1:W
        if R(x, y) == 127
            % point
             result(x, y, 1) =0; 
             result(x, y, 2) =0; 
             result(x, y, 3) =255;
        end;
    end
end
figure, imshow(result);
end

