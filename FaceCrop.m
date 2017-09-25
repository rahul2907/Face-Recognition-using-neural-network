

%to find features of a image

function FVvec = FaceCrop(I)
%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;


%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);
% imshow(I); hold on
% for i = 1:size(BB,1)
%     rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
% end
%FVArray(:,:,100);
x=1;
for i = 1:size(BB,1)

  FV=IterFaceCrop(I,BB,i);
  X=FV;
  X=X';
    if x==1;
     FVArray=X;
    end
     if x>1
    FVArray=CombineFeature(FVArray,X);
     end
	 x=x+1;
end

FVvec=FVArray;

end