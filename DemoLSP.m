
%this is the method which is used to get the features out of a image 
%basically this method is similar to LBP (local binary pattern),here
%we not only see the surrounding 8 pixels but one layer ahead of it 
%in that direction and check if the pixel value increases or decreases
% if we have three pixel at (1,0) then in right direction we check 
% if(val(2,0)& val(3,0)) > (1,0) or (val(2,0)& val(3,0)) < (1,0) then here we
%put value as 0 otherwise 1.
%similarly check in 8 directions and obtained a 8-bit binary number 
%that will be converted to decimal number by below method 

function FV=DemoLSP(I2)

% figure,imshow(I)  
%% Crop    
%I2 = imcrop(I);   
%figure, imshow(I2) ;
%  pad = [10 10] - size(I2);
%  pad(pad<0) = 0;
%  I2 = padarray(I2, floor(pad./2));

   disp(size(I2));
   w=size(I2,1);     
   h=size(I2,2);  
  
 scale = 2.^[7 6 5; 0 -inf 4; 1 2 3];  
    for i=3:w-2  
        for j=3:h-2    
         J0=I2(i,j);
         x=0;
         if  ((I2(i,j)<I2(i-1,j-1)) && (I2(i-1,j-1)<I2(i-2,j-2))) || ((I2(i,j)>I2(i-1,j-1)) && (I2(i-1,j-1)>I2(i-2,j-2)))
          I3(i-1,j-1)=0;
          end
         if  ((I2(i,j)>I2(i-1,j-1)) && (I2(i-1,j-1)<I2(i-2,j-2))) || ((I2(i,j)<I2(i-1,j-1)) && (I2(i-1,j-1)>I2(i-2,j-2)))
          I3(i-1,j-1)=1;
          x=x+1;
          end
         if  ((I2(i,j)<I2(i-1,j)) && (I2(i-1,j)<I2(i-2,j))) || ((I2(i,j)>I2(i-1,j)) && (I2(i-1,j)>I2(i-2,j)))
          I3(i-1,j)=0; 
          end
         if  ((I2(i,j)>I2(i-1,j)) && (I2(i-1,j)<I2(i-2,j))) || ((I2(i,j)<I2(i-1,j)) && (I2(i-1,j)>I2(i-2,j)))
          I3(i-1,j)=1;
           x=x+1;
           end
         if  ((I2(i,j)<I2(i-1,j+1)) && (I2(i-1,j+1)<I2(i-2,j+2))) || ((I2(i,j)>I2(i-1,j+1)) && (I2(i-1,j+1)>I2(i-2,j+2)))
          I3(i-1,j+1)=0; 
          end
         if  ((I2(i,j)>I2(i-1,j+1)) && (I2(i-1,j+1)<I2(i-2,j+2))) || ((I2(i,j)<I2(i-1,j+1)) && (I2(i-1,j+1)>I2(i-2,j+2)))
          I3(i-1,j+1)=1;
           x=x+1;
           end
         if  ((I2(i,j)<I2(i,j+1)) && (I2(i,j+1)<I2(i,j+2))) || ((I2(i,j)>I2(i,j+1)) && (I2(i,j+1)>I2(i,j+2)))
          I3(i,j+1)=0;
          end
         if  ((I2(i,j)>I2(i,j+1)) && (I2(i,j+1)<I2(i,j+2))) || ((I2(i,j)<I2(i,j+1)) && (I2(i,j+1)>I2(i,j+2)))
          I3(i,j+1)=1;
           x=x+1;
           end
         if  ((I2(i,j)<I2(i+1,j+1)) && (I2(i+1,j+1)<I2(i+2,j+2))) || ((I2(i,j)>I2(i+1,j+1)) && (I2(i+1,j+1)>I2(i+2,j+2)))
          I3(i+1,j+1)=0;
          end
         if  ((I2(i,j)>I2(i+1,j+1)) && (I2(i+1,j+1)<I2(i+2,j+2))) || ((I2(i,j)<I2(i+1,j+1)) && (I2(i+1,j+1)>I2(i+2,j+2)))
          I3(i+1,j+1)=1;
           x=x+1;
           end
         if  ((I2(i,j)<I2(i+1,j)) && (I2(i+1,j)<I2(i+2,j))) || ((I2(i,j)>I2(i+1,j)) && (I2(i+1,j)>I2(i+2,j)))
          I3(i+1,j)=0;
          end
         if  ((I2(i,j)>I2(i+1,j)) && (I2(i+1,j)<I2(i+2,j))) || ((I2(i,j)<I2(i+1,j)) && (I2(i+1,j)>I2(i+2,j)))
          I3(i+1,j)=1;
           x=x+1;
           end
         if  ((I2(i,j)<I2(i+1,j-1)) && (I2(i+1,j-1)<I2(i+2,j-2))) || ((I2(i,j)>I2(i+1,j-1)) && (I2(i+1,j-1)>I2(i+2,j-2)))
              I3(i+1,j-1)=0;
         end
              if  ((I2(i,j)>I2(i+1,j-1)) && (I2(i+1,j-1)<I2(i+2,j-2))) || ((I2(i,j)<I2(i+1,j-1)) && (I2(i+1,j-1)>I2(i+2,j-2)))
          I3(i+1,j-1)=1;
           x=x+1;
         end
           if  ((I2(i,j)<I2(i,j-1)) && (I2(i,j-1)<I2(i,j-2))) || ((I2(i,j)>I2(i,j-1)) && (I2(i,j-1)>I2(i,j-2)))
          I3(i,j-1)=0;     
         end
          if  ((I2(i,j)>I2(i,j-1)) && (I2(i,j-1)<I2(i,j-2))) || ((I2(i,j)<I2(i,j-1)) && (I2(i,j-1)>I2(i,j-2)))
          I3(i,j-1)=1; 
           x=x+1;           
         end
%          ans =0;
%          for i=0:7
%             if(x>0)
%                 ans=ans+2^(7-i);
%                 x=x-1;
%             end
%          end
         LSP(i,j)=uint8(I3(i-1,j-1)*2^7+I3(i-1,j)*2^6+I3(i-1,j+1)*2^5+I3(i,j+1)*2^4+I3(i+1,j+1)*2^3+I3(i+1,j)*2^2+I3(i+1,j-1)*2^1+I3(i,j-1)*2^0); 
%       LSP(i,j)=uint8(ans); 
      %disp(LBP(i,j));
        end
    end  
    I=mat2gray(LSP);
    m=mean(I);
    FV=m;
	
end
	
