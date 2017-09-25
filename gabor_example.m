
% this function is used to detect edges and curves in image
%uses gabor_fn as a util function which uses wave form equation
function FV= gabor_example(im)

lambda  = 8;
theta   = 0;
psi     = [0 pi/2];
gamma   = 0.5;
bw      = 1;
N       = 8;
img_in = im2double(im);
% img_in(:,:,2:3) = [];   % discard redundant channels, it's gray anyway

img_out = zeros(size(img_in,1), size(img_in,2), N);
for n=1:N
    gb = gabor_fn(bw,gamma,psi(1),lambda,theta)...
        + 1i * gabor_fn(bw,gamma,psi(2),lambda,theta);
    
    % gb is the n-th gabor filter
    img_out(:,:,n) = imfilter(img_in, gb, 'symmetric');
    % filter output to the n-th channel
    theta = theta + 2*pi/N;
    % next orientation
end
% figure(1),imshow(img_in);
imshow(img_in);
title('input image');
img_out_disp = sum(abs(img_out).^2, 3).^0.5;
% default superposition method, L2-norm
img_out_disp = img_out_disp./max(img_out_disp(:));
% normalize
% figure(2),imshow(img_out_disp);
imshow(img_out_disp);
title('gabor output, L-2 super-imposed, normalized');

FV=DivedeInto9Parts(img_out_disp);


