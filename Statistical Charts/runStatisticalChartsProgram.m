function runStatisticalChartsProgram( image )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
[colors, ratios , isBar] = Edgebased(image, Median_filter(image));
  rectangleImage = getRect(image) ; 
    if (~isBar)
      [points] = getListOfPointObjects(rectangleImage,colors) ;
       showChartResult(rgb2gray(rectangleImage),points ,ratios);
    end
end

