function [ area ] =  getRectArea(maxx, minx,maxy,miny)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
area = (uint32( maxx -minx ) *( uint32(maxy - miny ) ))  ;  
end

