function result= GeometricLinearTransform(I, Matrix)
%GEOMETRICLINEARTRANSFORM Summary of this function goes here
%   Detailed explanation goes here
%S = [cos(45*(pi/180)) sin(45*(pi/180)) 0; -sin(45*(pi/180)) cos(45*(pi/180)) 0; 0 0 1];
%S = [1 yShear 0; xShear 1 0; 0 0 1];
%S = [1.5 0 0; 0 1.5 0; 0 0 1];
disp(pi);

[H, W, L] = size(I) ;

lax = Matrix*[1;1;1];
lbx = Matrix*[H;1;1];
ray = Matrix*[1;W;1];
rby = Matrix*[H;W;1];

minx = ceil(min([lax(1,1), lbx(1,1), ray(1,1), rby(1,1)]));
miny = ceil(min([lax(2,1), lbx(2,1), ray(2,1), rby(2,1)]));

maxx = ceil(max([lax(1,1) lbx(1,1) ray(1,1) rby(1,1)]));
maxy = ceil(max([lax(2,1) lbx(2,1) ray(2,1) rby(2,1)]));

T = [1 0 -minx+1; 0 1 -miny+1; 0 0 1];
Matrix = T * Matrix;
%disp(T);
%disp(Matrix);
result = uint8(zeros(maxx - minx, maxy - miny, L));
%disp(maxx);
%disp(maxy);

    for	x=1:maxx-minx
        for y=1:maxy-miny
            pointdash = [x;y;1];
            point = inv(Matrix)*pointdash;
            if(1 > point(1,1) || 1 > point(2,1) || point(1,1) > H  || point(2,1) > W) 
                continue;
            end;
            result(x, y, :) = I(ceil(point(1,1)), ceil(point(2,1)), :);

        end

    end


end
