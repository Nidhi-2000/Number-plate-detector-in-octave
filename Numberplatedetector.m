pkg load image
im=imread("/home/nidhi/imageprocessing-octave/car.jpg")  % use the path from your system
figure;imshow(im);
imgray=rgb2gray(im);
 figure;imshow(imgray);
 imbin = im2bw(imgray);
figure;imshow(imbin);
im = edge(imgray,'prewitt');
figure;imshow(im);

%Below steps is to find location of numberplates
Iprops = regionprops(im,'BoundingBox','Area');
count = numel(Iprops);
maxa = Iprops.Area;
boundingBox = Iprops.Area;
for i=1:count
  if maxa<Iprops(i).Area;
    maxa=Iprops(i).Area;
    boundingBox=Iprops(i).BoundingBox;
  endif
endfor


 % final bounding box coordinates are the number plate co ordinates
 
 im=imcrop(imbin,boundingBox); % crop the number plate area
 figure;imshow(im);
 im = -im;
 figure;imshow(im);
 im=bwareaopen(im,100); %remove some object if its width is too long or too short than 100
 [h,w]=size(im); % get width and height ofnumber plate
 figure;imshow(im);
 
 %to read letter from number plate
 
 Iprops = regionprops(im,'BoundingBox','Area','Image');
 count = numel(Iprops);
 
 % to extract letters from number plate and display
 for i=1:count 
   width = length(Iprops(i).Image(1::));
   height = length(Iprops(i).Image(;,1));
   if width (h/3) && height > (h/4)
     figure;imshow(~Iprops(i).Image);
  
 
