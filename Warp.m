function result = Warp(I1, pts1, pts2)
%WRAP Summary of this function goes here
%   Detailed explanation goes here
pts1(3,:)=1;
pts2(3,:)=1;

W = (pts2*pts1')*((pts1*pts1')^-1);
result = GeometricLinearTransform(I1,W);
end