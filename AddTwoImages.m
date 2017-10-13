function result = AddTwoImages(image1, image2)

[H W L] = size(image1);
img3 = imresize(image2, [H W]);
result = uint8(zeros(H, W, L));

result = image1 + img3;
for x=1:H
    for y=1:W
      
        res = double(double(image1(x, y, :)) + double(img3(x,y, :)));
        result(x,y, :) = mod(res, 255);
    end
end
end