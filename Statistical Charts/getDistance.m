function [ distance ] = getDistance( X , Y  )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
X = double(X);
Y = double(Y); 
distance = sqrt(double(abs(X(1) - Y(1)))^2 + (abs(X(2) - Y(2)))^2 + (abs(X(3) - Y(3)))^2);

end

