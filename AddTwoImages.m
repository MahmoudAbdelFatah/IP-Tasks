function result = AddTwoImages(image1, image2)

[H, W, L] = size(image1);
img3 = imresize(image2, [H W]);
result = uint16(zeros(H, W, L));
result = double(result);

result = double(image1) + double(img3);

result = Contrast(result, 0, 255);
end