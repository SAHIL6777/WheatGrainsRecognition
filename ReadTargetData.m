
for i=1:size(DataTarget,4)

            img = DataTarget(:,:,:,i);
            img_reb=imresize(img,[50,50]);
            img_reb_r=double(img_reb(:,:,1));
            img_reb_g=double(img_reb(:,:,2));
            img_reb_b=double(img_reb(:,:,3));
% % % % % % % % %             
% % % % % % % % %             %% Image HoG Features
% % % % % % % % %             imgszfilt_r = medfilt2(img_reb_r);
% % % % % % % % %             imgszfilt_g = medfilt2(img_reb_g);
% % % % % % % % %             imgszfilt_b = medfilt2(img_reb_b);
% % % % % % % % %             [hog1_r,visualization] = extractHOGFeatures(imgszfilt_r,'CellSize',[8 8]);
% % % % % % % % %             [hog1_g,visualization] = extractHOGFeatures(imgszfilt_g,'CellSize',[8 8]);
% % % % % % % % %             [hog1_b,visualization] = extractHOGFeatures(imgszfilt_b,'CellSize',[8 8]);
% % % % % % % % %             hog1 = cat(3,hog1_r,hog1_g,hog1_b);
% % % % % % % % %             %% Image GLCM Features
% % % % % % % % %             glcm_r = graycomatrix(img_reb_r); 
% % % % % % % % %             glcm_g = graycomatrix(img_reb_g); 
% % % % % % % % %             glcm_b = graycomatrix(img_reb_b); 
% % % % % % % % %             stats_r = graycoprops(glcm_r);
% % % % % % % % %             stats_g = graycoprops(glcm_g);
% % % % % % % % %             stats_b = graycoprops(glcm_b);
% % % % % % % % %             stats = [stats_r.Contrast; stats_r.Correlation; stats_r.Energy; stats_r.Homogeneity; stats_g.Contrast; stats_g.Correlation; stats_g.Energy; stats_g.Homogeneity; stats_b.Contrast; stats_b.Correlation; stats_b.Energy; stats_b.Homogeneity];
% % % % % % % % %             %% Concatenate Features
% % % % % % % % %             Data_Target_Final(:,i) = double([img_reb(:);hog1(:);stats]);
            Data_Target_Final(:,i) = [img_reb_r(:);img_reb_g(:);img_reb_b(:)];
end

% % % % % % % % % % % % % % % % % % [m,n]=size(Data);
% % % % % % % % % % % % % % % % % % for p=1:n
% % % % % % % % % % % % % % % % % %     yfit(:,p) = sim(net1, Data_Target_Final(:, p));
% % % % % % % % % % % % % % % % % % % %     y_temp=rem((find(yfit==max(yfit(:,p)))),5);
% % % % % % % % % % % % % % % % % %     [~,y_tem]=max(yfit(:,p));
% % % % % % % % % % % % % % % % % %     y_temp=rem(y_tem,5);
% % % % % % % % % % % % % % % % % %     if (y_temp==0)
% % % % % % % % % % % % % % % % % %         y(p)=5;
% % % % % % % % % % % % % % % % % %     else
% % % % % % % % % % % % % % % % % %         y(p)=y_temp;
% % % % % % % % % % % % % % % % % %     end
% % % % % % % % % % % % % % % % % % % %     y_f(p)=y;
% % % % % % % % % % % % % % % % % % % %     y(p) = find(yfit==max(yfit(:,p)));
% % % % % % % % % % % % % % % % % % end


% % % % % % % load('WheatGrainModel_26102020.mat');
% % % % % % % load('WheatGrainModel_01022021.mat');
load('WheatGrainModel_02022021.mat');
yfit = trainedModel.predictFcn(Data_Target_Final);