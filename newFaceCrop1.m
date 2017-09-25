 
function newFaceCrop1
clear all
clc

orl_faces='G:\college\Major Project\orl_faces\';    %path to the folder from where we take the input images
orl_faces_content = dir ([orl_faces,'*']);
norlface= size (orl_faces_content,1);
file_ext = '.pgm';
fprintf ('Loading Faces ');
x=1;
Targets=repmat(0,5,50);
FVArray=[];
FDetect = vision.CascadeObjectDetector;
disp('norlface:');
disp(norlface);
for j=1:norlface
string = [orl_faces,orl_faces_content(j,1).name];
string=strcat(string,'\');
face_folder = string;
folder_content = dir ([face_folder,'*',file_ext]);
nface = size (folder_content,1);
disp('nface');
disp(nface);
for k=1:nface   
    string = [face_folder,folder_content(k,1).name];
    disp(string);
    image = imread(string);
    disp(size(image));
    pad = [134 114] - size(image);
    pad(pad<0) = 0;
    I = padarray(image, floor(pad./2));
%     I=image;
    BB = step(FDetect,I);
    disp('BB:');
    disp(BB);
    for i = 1:size(BB,1)
%   J1=repmat(j-2,1,3528);
    FV=IterFaceCrop(I,BB,i);
    X=FV;
    X=X';
    if x==1;
     FVArray=X;
    end
     if x>1
    FVArray=CombineFeature(FVArray,X);
     end
    
     Targets(j-1,x)=1;
     x=x+1;
    end
 end
end
% FVArray=FVArray';
% targets=targets';
 disp(size(FVArray));
% disp('FVArray:');
% disp(FVArray);
 disp(size(Targets));
%  disp('Targets:');
% disp(Targets);
NNT(FVArray,Targets);

end
