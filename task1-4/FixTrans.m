function [FixedSheet, xTrans, yTrans]= FixTrans(ModelSheet, TransSheet)
%FIXTRANS Summary of this function goes here
%   Detailed explanation goes here

% m1 = imread('Model.bmp');
% a = imread('Ans1.bmp');
[H, W, ~] = size(TransSheet);
m = rgb2gray(ModelSheet);
 TransSheet = rgb2gray(TransSheet);
% m = double(m);
% TransSheet = double(TransSheet);

F = fft2(m);
G = fft2(TransSheet);

Fimag = conj(F);
coff = ((G.*Fimag))./(abs(G.*Fimag));
res = ifft2(coff);
figure, imshow(res);
max = 0;
indx = 1;
indy = 1;
for x=1:H
    for y=1:W
        if res(x, y) > max
            max = res(x, y);
            indx = x;
            indy = y;
        end;
    end
end
xTrans = indx-1;
yTrans = indy-1;
t = [1 0 -xTrans; 0 1 -yTrans ; 0 0 1];
if xTrans > H/2
    xTrans = H - xTrans;
    t = [1 0 xTrans; 0 1 -yTrans ; 0 0 1];
end
if yTrans > W/2
    yTrans = W - yTrans;
    t = [1 0 -xTrans; 0 1 yTrans ; 0 0 1]; 
end

disp(xTrans);
disp(yTrans);

FixedSheet = Trans(TransSheet, t);

end

