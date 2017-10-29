function [FixedSheet, xTrans, yTrans]= FixTrans(m1, a)
%FIXTRANS Summary of this function goes here
%   Detailed explanation goes here

% m1 = imread('Model.bmp');
% a = imread('Ans1.bmp');
m = rgb2gray(m1);

m = double(m);
a = double(a);

F = fftshift(fft2(m));
G = fftshift(fft2(a));

Fimag = conj(F);
FixedSheet = (G.*Fimag)/abs(G.*Fimag);


end

