clc;
clear all;
close all;

% Load the image
img = imread("C:\Users\manth\Downloads\dip dataset\WhatsApp Image 2024-11-11 at 6.53.19 PM.jpeg");
img_gray = rgb2gray(img);

% Displaying original image
figure;
%subplot(2,3,1);
imshow(img);
title('Original Image');

% Mask Creation for Damaged Areas
% Create a mask(by limiting the gray scale)
mask = img_gray > 170 | img_gray < 20;

% Display the masked image
%subplot(2,3,2);
imshow(mask);
title('Mask');

% Using Coherent Inpainting for restoration
% Separating colours to restore colour in output image
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Apply inpainting for separate colours of the mask
R_inpainted = inpaintCoherent(R, mask);
G_inpainted = inpaintCoherent(G, mask);
B_inpainted = inpaintCoherent(B, mask);

% Combining the inpainted mask by using concatination function
img_inpainted = cat(3, R_inpainted, G_inpainted, B_inpainted);

%subplot(2,3,3);
imshow(img_inpainted);
title('Inpainted Image');

% creating mask of the inpainting to create another mask to process
% it again for better results

img_gray_of_InPainting = rgb2gray(img_inpainted);

imshow(img_gray_of_InPainting);
title('Grey of Inpainted image')

% 2nd mask of the inpainting image
mask_of_inpainting_img = img_gray_of_InPainting > 200 | img_gray_of_InPainting < 70;
%subplot(2,3,2);
imshow(mask_of_inpainting_img);
title('2nd Mask');

% inPainting of this mask of the image to get better results
R2 = img_inpainted(:,:,1);
G2 = img_inpainted(:,:,2);
B2 = img_inpainted(:,:,3);

R_inpainted_2 = inpaintCoherent(R2, mask);
G_inpainted_2 = inpaintCoherent(G2, mask);
B_inpainted_2 = inpaintCoherent(B2, mask);

img_inpainted_2 = cat(3, R_inpainted_2, G_inpainted_2, B_inpainted_2);
%subplot(2,3,3);
imshow(img_inpainted_2);
title('2nd Inpainted Image');

% Subtle Contrast Adjustment on Restored Image
% Adjust contrast with imadjust for each channel
R_adjusted_2 = imadjust(R_inpainted_2, stretchlim(R_inpainted_2, [0.02 0.98]));
G_adjusted_2 = imadjust(G_inpainted_2, stretchlim(G_inpainted_2, [0.02 0.98]));
B_adjusted_2 = imadjust(B_inpainted_2, stretchlim(B_inpainted_2, [0.02 0.98]));

% Recombine the contrast-adjusted channels
img_adjusted = cat(3, R_adjusted_2, G_adjusted_2, B_adjusted_2);

%subplot(2,3,4);
imshow(img_adjusted);
title('Subtle Contrast Adjustment');

%--------------------------------------------------------------------
%Colour enhancement 

if size(img_adjusted, 3) == 3
    lab = rgb2lab(img_adjusted);
    L = imadjust(lab(:,:,1) / 100) * 100;
    a = lab(:,:,2) * 1.1;
    b = lab(:,:,3) * 1.1;

    img_color_enhanced = lab2rgb(cat(3, L, a, b));
else
    img_color_enhanced = imadjust(img_adjusted);
end

%subplot(3,4,8);
imshow(img_color_enhanced);
title('Color Enhanced');

%----------------------------------------------------------------------
% Sharpening for Final Touch
% Apply sharpening to enhance edges and restore fine details
img_sharpened = imsharpen(img_color_enhanced, 'Radius', 2, 'Amount', 0.3);

%subplot(2,3,5);
imshow(img_sharpened);
title('Final Restored Image (Enhanced Sharpness)');

%------------------------------------------------------------------
%  Gentle Detail Recovery

restored = zeros(size(img_sharpened));
PSF = fspecial('gaussian', [3 3], 0.5);
for channel = 1:3
    restored(:,:,channel) = deconvlucy(img_sharpened(:,:,channel), PSF, 3);
end
% subplot(3,4,10);
imshow(restored);
title('Detail Recovered');
%------------------------------------------------------------------
%final image enhancement
final_image = imadjust(restored, [], [], 1.1); % Slight gamma adjustment
final_image = min(max(final_image, 0), 1);

%subplot(3,4,11);
imshow(final_image);
title('Final Enhanced Result');

%------------------------------------------------------------------
% --------------------------- Save and Display Metrics ---------------------------

imwrite(final_image, 'restored_painting_combined.jpg');

% Metrics
gray_original = rgb2gray(img);
gray_final = rgb2gray(final_image);

fprintf('\nImage Enhancement Metrics:\n');
fprintf('Contrast Change: %.2f%%\n', (std2(gray_final)/std2(gray_original) - 1) * 100);
fprintf('Mean Brightness Change: %.2f%%\n', (mean2(gray_final)/mean2(gray_original) - 1) * 100);
disp('Restoration complete. Final image saved as restored_painting_combined.jpg.');

%------------------------------------------------------------------

% Display the final result with the original for comparison
%subplot(2,3,6);
imshowpair(img, img_sharpened, 'montage');
title('Original vs. Restored Image');