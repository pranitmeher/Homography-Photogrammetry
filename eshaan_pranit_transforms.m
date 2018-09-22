% CSCI-631 Project
% Eshaan Shah (es7933@g.rit.edu)
% Pranit Meher (pxm3417@g.rit.edu)
% Object size estimation using photogrammetry
% This function performs the projective image transformations

function [projected_im_processed,projected_im_og] = ...
    eshaan_pranit_transforms(corners_actual, corners_estimated, ...
                                                image_og, image_processed)
%% 
% Projective Transformation
transformed_im = fitgeotrans(corners_actual, corners_estimated,... 
                                                    'projective');
                                                
%%
% Geometric transformation for the projective transformation

% For original image
projected_im_og = imwarp(image_og,transformed_im);

% Displaying image
% figure();
% imshow(projected_im_og);

% For binary image
projected_im_processed = imwarp(image_processed, transformed_im); 
end