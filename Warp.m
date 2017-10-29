function result = Warp(I1, pts1, pts2)
%WRAP Summary of this function goes here
%   Detailed explanation goes here
pts1(3,:)=1;
pts2(3,:)=1;

W = (pts2*pts1')*((pts1*pts1')^-1);
% P1 = [70 335 280 12; 16 133 280 167; 1 1 1 1];
% cc = ceil(W*P1;

result = GeometricLinearTransform(I1,W);
% result = res(cc(1,1):cc(1,3), cc(2,1):cc(2,3), :);
end