function [segmentedimage] = Lightbrown(I_filepath)

%1) Read Image
image = imread(I_filepath);
subplot(1,2,1); imshow(image); title('Original Image');
%2) Get the dimensions of the image.  
% c is numberOfColorBands.
[h w c] = size(image);
segmentedimage = zeros(h,w,c);

for i=1:h
    for j = 1:w
        if image(i,j,1) > 100 && image(i,j,1) > (image(i,j,2)+20) && image(i,j,2) > (image(i,j,3)+20)        
            segmentedimage(i,j,:) = image(i,j,:);
        end
    end
end

subplot(1,2,2); imshow(uint8(segmentedimage)); title('Segmented Image');

end

