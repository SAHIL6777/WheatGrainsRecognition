 %%Image segmentation and extraction
% %  clc;
% %  clear all;
% %  close all;
% %  
%%Read Image
% % global Ipro
% % imagen=imread('F:\Memorres Digital Pvt Ltd\Wheat Grains\abc.jpg');
% % imagen=double(mask);
imagen=double(bw3);
%%Show image
%figure(1)
%imshow(imagen);
%title('INPUT IMAGE WITH NOISE')
%%Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
%%Convert to binary image
% % % % % % % % % threshold = graythresh(imagen);
% % % % % % % % % imagen =~im2bw(imagen,threshold);
%%Remove all object containing fewer than 30 pixels
% % % % % % % % % imagen = bwareaopen(imagen,30);
% % % % % % % % % pause(1)
%%Show image binary image
%figure(2)
%imshow(~imagen);
%title('INPUT IMAGE WITHOUT NOISE')
%%Label connected components
[L Ne]=bwlabeln(imagen);
%%Measure properties of image regions
propied=regionprops(L,'BoundingBox');
hold on
%%Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
%hold off
%pause (1)
%%Objects extraction
%figure
for n=1:Ne
    [r,c] = find(L==n);
    n1=A(min(r):max(r),min(c):max(c),1);
    n2=A(min(r):max(r),min(c):max(c),2);
    n3=A(min(r):max(r),min(c):max(c),3);
    N = cat(3,n1,n2,n3);
    nn = imresize(N,[100,100]);
% %     axes(handles.axes4)
% %     imshow(~n1);
% %     title('Segmented Characters');
    pause(0.5)
    % Construct filename for this particular image.
    baseFileName = sprintf('img %d.jpg', n);
    % Specify yourFolder in advance.
    % Prepend the folder to make the full file name.
    fullFileName = fullfile('F:\Memorres Digital Pvt Ltd\Wheat Grains\R', baseFileName);
    % Do the write to disk.
    imwrite(N, fullFileName);
    DataTarget(:,:,:,n)=nn;
    clear n1;
    clear n2;
    clear n3;
    clear N;
end

