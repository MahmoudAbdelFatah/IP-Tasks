function result = Brightness(image, Ch, offset)
red = image(:,:,1); % Red channel
green = image(:,:,2); % Green channel
blue = image(:,:,3); % Blue channel
global img
    switch Ch
       case 'R'
          just_red = cat(3, red+offset, green, blue);
          img = just_red;
       case 'G'
          just_green = cat(3, red, green+offset, blue);
          img = just_green;
       case 'B'
          just_blue = cat(3, red, green, blue+offset);
          img = just_blue;
    end
result = img;
end