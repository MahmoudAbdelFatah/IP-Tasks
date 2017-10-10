function result = AddTwoImages(image1, image2)

[H W L] = size(image1);
img3 = imresize(image2, [H W]);
result = image1 + img3;

end