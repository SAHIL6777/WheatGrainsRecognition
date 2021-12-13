
clc;
clear all;
close all;

im = imread('F:\Memorres Digital Pvt Ltd\Wheat Grains\WheatGrain Image\IMG_20210202_112426.jpg');
% % im = imread('F:\Memorres Digital Pvt Ltd\Wheat Grains\Wheat Test Images\57.jpg');
% % im = imread('F:\Memorres Digital Pvt Ltd\Wheat Grains\WheatGrain Image\IMG_20180831_214219 (2).jpg');
% % im = imread('F:\Memorres Digital Pvt Ltd\Wheat Grains\WheatGrain Image\WhatsApp Image 2020-11-03 at 11.42.21.jpeg');
% % im = imread('F:\Memorres Digital Pvt Ltd\Wheat Grains\abc.jpg');
% % im = imread('F:\Memorres Digital Pvt Ltd\Wheat Grains\WheatGrain Image\BGFF73.jpg');
% % im = imread('F:\Memorres Digital Pvt Ltd\Wheat Grains\image117.jpg');
% % im = imread('F:\Memorres Digital Pvt Ltd\Wheat Grains\best-quality-wheat-500x500.jpg');
% % im = imread('F:\Memorres Digital Pvt Ltd\Wheat Grains\download.jpg');
figure, imshow(im);
A = im;
Ainv = imcomplement(A);
Binv = imreducehaze(Ainv);
Bimp = imcomplement(Binv);
B = imguidedfilter(Bimp);
hsvImage = rgb2hsv(B);
% % hImage = hsvImage(:,:,1);
sImage = hsvImage(:,:,2);
im=imcomplement(sImage);
im = imcomplement(im);
% % im = B;
%%% im2filter %%%%%%%%%
im = imgaussfilt(im,2);
bw = im2bw(im);
L = watershed(bw);
Lrgb = label2rgb(L);
% % % % % % % % % % % % figure,imshow(Lrgb)

%%
% When I saw that result, I was puzzled at first. Then I realized what was
% going on. Let me use |imfuse| to show these two images together, zooming
% in on one particular blob.
% % figure,
% % % % % % % % % % % % imshow(imfuse(bw,Lrgb))
% % axis([10 175 15 155])

%%
% You see, the watershed transform always gives you one watershed region
% for every local minimum (or regional minimum) in the image. These little
% black "noise spots" are local minima, and so there's a watershed region
% around each one.
%
% Even if we fill these holes, though, just using the watershed transform
% by itself is never going to produce the segmentation that the customer
% was seeking. That brings me to my point about the distinction between
% watershed segmentation and the watershed transform. _Watershed
% segmentation_ refers to a family of algorithms that are *based* on the
% watershed transform. Except for very specific cases, the watershed
% transform isn't a full segmentation method on its own.
%
% Some years ago, I wrote a MathWorks newsletter article called
% <https://www.mathworks.com/company/newsletters/articles/the-watershed-transform-strategies-for-image-segmentation.html
% The Watershed Transform: Strategies for Image Segmentation>. It's worth
% reviewing in order to brush up on the basics. An central concept from the
% article is this:
%
% The key behind using the watershed transform for segmentation is this:
% *Change your image into another image whose catchment basins are the
% objects you want to identify.*
%
% For an image such as this, consisting of roughly circular, touching
% blobs. the distance transform can be useful for producing an image whose
% "catchment basins are the objects you want to identify."
%
% Before go to the distance transform, though, let's clean up the noise a
% bit. The function |bwareaopen| can be used to remove very small dots. It
% removes them in the foreground, though, so we complement the image before
% and after calling |bwareaopen|.

bw2 = ~bwareaopen(~bw, 10);
% % % % % % % % % % % % % % % % % % figure,imshow(bw2)

%%
D = -bwdist(~bw);
% % % % % % % % % % % % % % % % % % figure,imshow(D,[])

%%
% Now we're starting to get somewhere. Next, compute the watershed
% transform of |D|.

Ld = watershed(D);
% % % % % % % % % % % % % % % % % % figure,imshow(label2rgb(Ld))

%%
% The watershed ridge lines, in white, correspond to |Ld == 0|. Let's use
% these ridge lines to segment the binary image by changing the
% corresponding pixels into background.

bw2 = bw;
bw2(Ld == 0) = 0;
% % % % % % % % % % % % % % % % % % figure,imshow(bw2)

%%
% The "raw" watershed transform is known for its tendency to "oversegment"
% an image. The reason is something I mentioned above: each local minimum,
% no matter how small, becomes a catchment basin. A common trick, then, in
% watershed-based segmentation methods is to filter out tiny local minima
% using |imextendedmin| and then modify the distance transform so that no
% minima occur at the filtered-out locations. This is called "minima
% imposition" and is implemented via the function |imimposemin|.
%
% The following call to |imextendedmin| should ideally just produce small
% spots that are roughly in the middle of the cells to be segmented. I'll
% use |imshowpair| to superimpose the mask on the original image.

mask = imextendedmin(D,2);
% % % % % % % % % % % % % % % % % % figure,imshowpair(bw,mask,'blend')

% % stats = regionprops(mask,{'Area','Centroid','MajorAxisLength','MinorAxisLength'});
% % stats = struct2table(stats);
% Show the result

%%
% Home stretch, now. Modify the distance transform so it only has minima at
% the desired locations, and then repeat the watershed steps above.

D2 = imimposemin(D,mask);
Ld2 = watershed(D2);
bw3 = bw;
bw3(Ld2 == 0) = 0;
figure,imshow(bw3)

stats = regionprops(bw3,{'Area','Centroid','MajorAxisLength','MinorAxisLength'});
stats = struct2table(stats);

% % figure
% % % % imshow(im1)
% % 
% % imshow(bw3)
% % hold on
% % for kk = 1:height(stats)
% %   text(stats.Centroid(kk,1)+10, stats.Centroid(kk,2),...
% %      num2str(stats.Area(kk)),'Color','r')
% % % %   set(text,'Color','r')
% % end

% % NoOfGrains = numel(stats);
%Read All Centers into Array
GrainCenters = stats.Centroid;
% Mark Grains at Center.
figure(1);
imshow(B);
hold on;
text(GrainCenters(:,1), GrainCenters(:,2),'*','Color','k');
% % text(rows, columns,'o','Color','r');
hold off
% % % % fprintf('\nNo. Of Total Grains found in the Image = %d\n', numel(GrainCenters(:,1)));

segment_image

ReadTargetData

fprintf('\nNo. Of Complete Grains found in the Image = %d\n', sum(yfit == 1002));
fprintf('\nNo. Of Broken Grains found in the Image = %d\n', sum(yfit == 1000));
fprintf('\nNo. Of Infected Grains found in the Image = %d\n', sum(yfit == 1003));
