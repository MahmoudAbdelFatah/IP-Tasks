function [ area ] =  getRectArea(maxx, minx,maxy,miny)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
area = (uint16( maxx -minx ) *( uint16(maxy - miny ) ))  ;  
end

