function [NumOfWrongAnswers] = Correct(ModelSheet, AnswerSheet)
%CORRECT Summary of this function goes here
%   Detailed explanation goes here
% [H, W, ~] = size(ModelSheet);
% % AnswerSheet = imresize(AnswerSheet, [H W]);
% NewCol = rand(30,1);
NumOfWrongAnswers = 0;
res = ModelSheet - AnswerSheet;
res = res(50:end-50, 50:end-50,:);

threshold = graythresh(res);
bimage = im2bw(res,threshold);
% figure, imshow(bimage);
[L, num] = bwlabel(bimage);  
[H, W, ~] = size(L);
count = uint16(zeros(num, 1));
result = uint8(zeros(H, W));
for x=1:H
    for y=1:W
        if L(x,y) ~= 0
            count(L(x,y), 1) = count(L(x,y), 1)+1;
        end;
    end;
end;
for x=1:num
    if count(x, 1) >15
        NumOfWrongAnswers = NumOfWrongAnswers+1;
    end
end
% t(1,3) = t(1,3)*-1;
% t(2,3) = t(2,3)*-1;
% re = Trans(res, t);
% figure, imshow(res);

end