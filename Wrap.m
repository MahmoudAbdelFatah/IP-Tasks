function result = Wrap(I1, Pts1, Pts2)
%WRAP Summary of this function goes here
%   Detailed explanation goes here
[H X L] = size(I1);
disp(H);
disp(X);
W = Pts2 / Pts1;

disp(W);

P1 = [ 100 295 330 137 ;215 95 660 780 ; 1 1 1 1];
k = W * P1;
disp(k);
result = GeometricLinearTransform(I1, W);

end
