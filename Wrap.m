function result = Wrap(I1, Pts1, Pts2)
%WRAP Summary of this function goes here
%   Detailed explanation goes here

W = Pts2 / Pts1;

disp(W);
P1 = [215 95 660 780 ; 100 295 330 137 ; 1 1 1 1];
k = W * P1;
disp(k);
result = GeometricLinearTransform(I1, W);
end
