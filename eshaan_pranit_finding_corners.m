% CSCI-631 Project
% Eshaan Shah (es7933@g.rit.edu)
% Pranit Meher (pxm3417@g.rit.edu)
% Object size estimation using photogrammetry
% This function finds four corners of the rectangular box in the image

function image_corners = eshaan_pranit_finding_corners(input_im)
%% 
% Using the Find function to find the non zero elements in the image

% finding all the '1's in this case as this is a binary image
[y_coord, x_coord] = find(input_im);    % Vector of the X and Y coordinates
                                        % of all the 1's in the image
                                        
%% 1)
% Finding the top-left corner
[index, loc] = min(y_coord + x_coord);

% Storing the top-left corner to the vector of corners
image_corners(1,:) = [x_coord(loc), y_coord(loc)];

%% 2)
% Finding the top-right corner
[index, loc] = min(y_coord - x_coord);     

% Storing the top-right corner to the vector of corners
image_corners(2,:) = [x_coord(loc), y_coord(loc)];

%% 3)
% Finding the bottom-right corner
[index, loc] = max(y_coord + x_coord);

% Storing the bottom-right corner to the vector of corners
image_corners(3,:) = [x_coord(loc), y_coord(loc)];

%% 4)
% Finding the bottom-left corner
[index, loc] = max(y_coord - x_coord);

% Storing the bottom-left corner to the vector of corners
image_corners(4,:) = [x_coord(loc), y_coord(loc)];

end