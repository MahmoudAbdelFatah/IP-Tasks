function result = forword(image, mat)

%S = [cos(45*(pi/180)) sin(45*(pi/180)) 0; -sin(45*(pi/180)) cos(45*(pi/180)) 0; 0 0 1];
%S = [1 yShear 0; xShear 1 0; 0 0 1];
%S = [1.5 0 0; 0 1.5 0; 0 0 1];
S = mat;
disp(pi);

[H W L] = size(image) ;

lax = S*[1;1;1];
lbx = S*[H;1;1];
ray = S*[1;W;1];
rby = S*[H;W;1];

minx = ceil(min([lax(1,1), lbx(1,1), ray(1,1), rby(1,1)]));
miny = ceil(min([lax(2,1), lbx(2,1), ray(2,1), rby(2,1)]));

maxx = ceil(max([lax(1,1) lbx(1,1) ray(1,1) rby(1,1)]));
maxy = ceil(max([lax(2,1) lbx(2,1) ray(2,1) rby(2,1)]));

T = [1 0 -minx+1; 0 1 -miny+1; 0 0 1];
result = uint8(zeros(maxx, maxy, L));

for	y=1:H
	for x=1:W
        point = [y;x;1];
        pointdash = T*S*point;
        result(ceil(pointdash(1,1)), ceil(pointdash(2,1)), :) = image(y, x, :);
	end
end
end
