% CSCI-631 Project
% Eshaan Shah (es7933@g.rit.edu)
% Pranit Meher (pxm3417@g.rit.edu)
% Object size estimation using photogrammetry
% This is the main function of the program

function [estimated_height, transformed_image_og] = ...
                            eshaan_pranit(img_og, actual_width)
    %% 1)
    % Pre-processing Step
    
    % Sharpening the image
    img_og = imsharpen(img_og);
    
    % Saving the original image
    image_sharpened = img_og;
    
    %% 2)
    % Processing the image for finding corners (making it binary)
    image_processed = eshaan_pranit_find_points(image_sharpened);
    
    %% 3)
    % Finding the corners of the rectangular box in the image
    image_corners = eshaan_pranit_finding_corners(image_processed);
    
    %% 4)
    % Plotting the box and finding the estimated location of the corners
    corners_estimated = eshaan_pranit_plot_and_find(img_og, image_corners);
    
    %% 5)
    % Image Transformations
    [transformed_image, transformed_image_og] = ...
        eshaan_pranit_transforms(image_corners, corners_estimated, ...
                                                img_og, image_processed);
                                            
    %% 6)
    % Finding the four corners of the transformed image
    image_corners_transformed = eshaan_pranit_finding_corners ...
                                                    (transformed_image);
                                                
    %% 7) 
    % Calculating the height of the box
    estimated_height = eshaan_pranit_calculate(...
                            image_corners_transformed, actual_width);
    
    %% 8) Printing the estimated height
    fprintf('The predicted height is %f\n', estimated_height);
    
end