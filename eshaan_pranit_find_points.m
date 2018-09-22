% CSCI-631 Project
% Eshaan Shah (es7933@g.rit.edu)
% Pranit Meher (pxm3417@g.rit.edu)
% Object size estimation using photogrammetry
% This function performs Morphological operations on the image on the 
% A channel of the LAB Colorspace

function Image_morphed_final = eshaan_pranit_find_points(input_im)
%% 
% Converting to LAB
I_lab_space = rgb2lab(input_im);

% Extracting the A channel
I_lab_a = I_lab_space(:,:,2);

% Saving this image 
I_lab_quantized = I_lab_a;

%%
% Quantizing and converting to binary image
thr = -10; % Threshold for quantization
low = 0;    
high = 1;   

I_lab_quantized(I_lab_quantized > thr) = low;
I_lab_quantized(I_lab_quantized <= thr) = high;

%%
% Morphological Operations

matrix = [1 3];                 
str = strel('rect', matrix);                        % Structuring Element
Image_morphed_open = imopen(I_lab_quantized,str);   % Performing Opening 

Image_morphed_comp = imcomplement(Image_morphed_open);  % Inverting
Image_morphed_erode = imerode(Image_morphed_comp,str); % Performing Erosion

Image_morphed_final = imcomplement(Image_morphed_erode); % Inverting                 

%% 
% Displaying the images
% figure();
% imshow(I_lab_a);            % Displaying the A channel from the Lab Space
% figure();
% imshow(Image_morphed_final);  % Displaying the quantized image 
                              % after morphological operations
end