% CSCI-631 Project
% Eshaan Shah (es7933@g.rit.edu)
% Pranit Meher (pxm3417@g.rit.edu)
% Object size estimation using photogrammetry
% This function plots the box and calculates the estimated location 
% of the corners

function corners_estimated = eshaan_pranit_plot_and_find(input_im, corners)
%% 
% Plotting the box on the image
% figure();
% imshow(input_im); 
% hold all
% plot(corners([1:4 1],1),corners([1:4 1],2),'r','linewidth',3);

%% 
% Estimating the actual location of corners of the box 
coord_left = mean(corners([1 4],1));
coord_right = mean(corners([2 3],1));
coord_up = mean(corners([1 2],2));
coord_down = mean(corners([3 4],2));

% Making the corners from the points above
corners_estimated = [coord_left coord_up; coord_right coord_up; 
                            coord_right coord_down; coord_left coord_down];

end