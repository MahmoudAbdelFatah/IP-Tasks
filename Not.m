function result = Not(image)

[H W L] = size(image) ;

result = uint8(zeros(H, W, L));

result(:, :, 1) = 255 - image(:, :, 1);
result(:, :, 2) = 255 - image(:, :, 2);
result(:, :, 3) = 255 - image(:, :, 3);
        

end