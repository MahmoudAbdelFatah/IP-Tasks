function runStatisticalChartsProgram( image )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
[colors, ratios , ~] = Edgebased(image, Median_filter(image));
  rectangleImage = getRect(image) ; 
  
   [points] = getListOfPointObjects(rectangleImage,colors) ;
    
   showChartResult(rectangleImage,points ,ratios);  
     
end

