% CSCI-631 Project
% Eshaan Shah (es7933@g.rit.edu)
% Pranit Meher (pxm3417@g.rit.edu)
% Object size estimation using photogrammetry
% This function estimates the actual height of the box

function estimated_height = eshaan_pranit_calculate(...
                                image_corners_transformed, actual_width)
%%
% calculating the sizes of the heights and widths in the image
top = image_corners_transformed(2,1) - image_corners_transformed(1,1);
down = image_corners_transformed(3,1) - image_corners_transformed(4,1);
left = image_corners_transformed(4,2) - image_corners_transformed(1,2);
right = image_corners_transformed(3,2) - image_corners_transformed(2,2);

% Taking mean
width = mean(top,down);
height = mean(left,right);

%%
% predicting the height
estimated_height = (height * actual_width)/ width;
end