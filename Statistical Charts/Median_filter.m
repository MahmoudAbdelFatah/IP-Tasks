function [B]=Median_filter( img  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
 
A = img ;
A = im2double(rgb2gray(A));
fun = @(x) median(x(:));
B = nlfilter(A,[9 9],fun);
%imshow(result)
end

