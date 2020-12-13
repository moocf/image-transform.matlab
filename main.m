clc;
clear;
close all;

% Load image (as gray)
imgName = 'pears.png';
img = imread(imgName);
img = rgb2gray(img);
xres = size(img, 1);
yres = size(img, 2);
figure; imshow(img);
title('Original image');

% Negative transformation
imgNegator = 255 * uint8(ones(xres, yres));
imgNegated = imgNegator - img;
figure; imshow(imgNegated);
title('Negative transform');

% Logarithmic transformation
imgLogarithmic = uint8(255*log(1 + double(img)/255));
figure; imshow(imgLogarithmic);
title('Logarithmic transform');

% Power Law transformation
imgPowerLaw = uint8(255*((double(img)/255).^2));
figure; imshow(imgPowerLaw);
title('Power Law transform');

% Find histogram
imgHistogram = uint32(zeros(1, 256));
for i = 1 : xres
  for j = 1 : yres
    imgHistogram(1, img(i, j) + 1) = imgHistogram(1, img(i, j) + 1) + 1;
  end
end
figure; plot(imgHistogram);
title('Histogram');
