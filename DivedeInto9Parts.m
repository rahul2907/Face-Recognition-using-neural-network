

%This function divides the image into nine parts and then we Apply LSP method on each parts
%and combine the features obtained from each subsequent part

function FV= DivedeInto9Parts(im)
grayImage = im; % Read in image.
% Figure out where to divide it.
[rows, columns, numberOfColorChannels] = size(grayImage);
r3 = int32(rows/3);
c3 = int32(columns/3);
% Extract the 9 images.

image1 = grayImage(1:r3, 1:c3);
image2 = grayImage(1:r3, c3+1:2*c3);
image3 = grayImage(1:r3, 2*c3+1:end);
image4 = grayImage(r3+1:2*r3, 1:c3);
image5 = grayImage(r3+1:2*r3, c3+1:2*c3);

image6 = grayImage(r3+1:2*r3, 2*c3+1:end);
image7 = grayImage(2*r3+1:end, 1:c3);

image8 = grayImage(2*r3+1:end, c3+1:2*c3);
image9 = grayImage(2*r3+1:end, 2*c3+1:end);

%Display the 9 images.
% subplot(3,3,1);
% imshow(image1);
% subplot(3,3,2);
% imshow(image2);
% subplot(3,3,3);
% imshow(image3);
% subplot(3,3,4);
% imshow(image4);
% subplot(3,3,5);
% imshow(image5);
% subplot(3,3,6);
% imshow(image6);
% subplot(3,3,7);
% imshow(image7);
% subplot(3,3,8);
% imshow(image8);
% subplot(3,3,9);
% imshow(image9);


CV=[];
disp(size(im));  %displays the size
L=DemoLSP(image1);
CV=CombineFeature(L,CV);
L=DemoLSP(image2);
CV=CombineFeature(L,CV);
L=DemoLSP(image3);
CV=CombineFeature(L,CV);
L=DemoLSP(image4);
CV=CombineFeature(L,CV);
L=DemoLSP(image5);
CV=CombineFeature(L,CV);
L=DemoLSP(image6);
CV=CombineFeature(L,CV);
L=DemoLSP(image7);
CV=CombineFeature(L,CV);
L=DemoLSP(image8);
CV=CombineFeature(L,CV);
L=DemoLSP(image9);
CV=CombineFeature(L,CV);

% imhist(uint8(CV));
FV=CV;

end