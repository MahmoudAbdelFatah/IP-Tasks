function [segmentedimages] = kMean(I_filepath,k)
%k is the number of objects (clusters)

%1) Read Image
image = imread(I_filepath);
subplot(1,k+1,1); imshow(image); title('Original Image');

cform = makecform('srgb2lab');
lab_x = applycform(image,cform);
ab = double(lab_x(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
cluster_idx = kmeans(ab,k,'distance','sqEuclidean', 'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);
segmentedimages = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for i = 1:k
    color = image;
    color(rgb_label ~= i) = 0;
    segmentedimages{i} = color;
    subplot(1,k+1,i+1); imshow(segmentedimages{i}); title(strcat('objects in cluster', num2str(i)));
end
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); % Enlarge figure to full screen.
end

