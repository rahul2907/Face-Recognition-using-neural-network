
%This function is used detect the face in the image

function iterFV=IterFaceCrop(I,BB,i)
% function FV=IterFaceCrop(I,BB,i)

%Returns Bounding Box values based on number of objects
% BB = step(FDetect,I);
% imshow(I); hold on
% for i = 1:size(BB,1)
%     rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
% end
%FVArray(:,:,100);

% for i = 1:size(BB,1)
 J= imcrop(I,BB(i,:));
 J=imresize(J,[54 54]);

FV=gabor_example(J);
 iterFV=FV;

end