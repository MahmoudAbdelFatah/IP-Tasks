function result = AddTwoImages(image1, image2)

[H W L] = size(image1);
img3 = imresize(image2, [H W]);
result = uint16(zeros(H, W, L));

%result = image1 + img3;
for x=1:H
    for y=1:W
      
        result(x,y, :) = double(double(image1(x, y, :)) + double(img3(x,y, :)));
    end
end
result = Contrast(result, 0, 255);
end