function runStatisticalChartsProgram( image )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
filteredImage =Median_filter(image) ;
[colors, ratios , isBar] = Edgebased(image,filteredImage ); 
  [rectangleImage ,hasLegendArea ] = getRect(image);
  if(hasLegendArea)% there is a legend Area 
   [points] = getListOfPointObjects(rectangleImage,colors) ;   
                  showChartResult(rectangleImage,points ,ratios);  
  elseif (isBar) 
      [ points ] = getBeginsPositionsOfBars(size(ratios,2));
                    showAdvancedChartResult(image ,points ,ratios );
  else
      adjustSegmentedObjects(size(ratios,2),image);
       [ points ] = getPositionsOfBieCharts(size(ratios,2),image ,ratios);
  end

     
end

