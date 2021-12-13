close all;
clear all;
clc;

D='F:\Memorres Digital Pvt Ltd\Wheat Grains\WheatClasses';
% % D='F:\Memorres Digital Pvt Ltd\Wheat Grains\WheatClassesAll';
Subdir=dir(D);
[m,~]=size(Subdir);

for i=1:(m-2)
    files=dir([D '\' Subdir(i+2).name]);
    [p,~]=size(files);
    for j=1:(p-2)
        img=imread([D '\' Subdir(i+2).name '\' files(j+2).name]);
        if i==1
% %             Image RGB break
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
            %% Concatenate Features
% % % % % % % % %             Data_b(:,j) = [img_reb(:);hog1(:);stats;i];
% %             img_reb_r=mapminmax(img_reb_r(:)',-1,1)';
% %             img_reb_g=mapminmax(img_reb_g(:)',-1,1)';
% %             img_reb_b=mapminmax(img_reb_b(:)',-1,1)';
            
            Data_b(:,j) = [img_reb_r(:);img_reb_g(:);img_reb_b(:)];
            Data_tar_b(:,j) = [1000];
        elseif i==2
            img_rebs=imresize(img,[50,50]);
            img_rebs_r=double(img_rebs(:,:,1));
            img_rebs_g=double(img_rebs(:,:,2));
            img_rebs_b=double(img_rebs(:,:,3));
% % % % % % % % %             img_rebs_r=img_rebs(:,:,1);
% % % % % % % % %             img_rebs_g=img_rebs(:,:,2);
% % % % % % % % %             img_rebs_b=img_rebs(:,:,3);
% % % % % % % % %             %% Image HoG Features
% % % % % % % % %             imgszfilt_r = medfilt2(img_rebs_r);
% % % % % % % % %             imgszfilt_g = medfilt2(img_rebs_g);
% % % % % % % % %             imgszfilt_b = medfilt2(img_rebs_b);
% % % % % % % % %             [hog2_r,visualization] = extractHOGFeatures(imgszfilt_r,'CellSize',[8 8]);
% % % % % % % % %             [hog2_g,visualization] = extractHOGFeatures(imgszfilt_g,'CellSize',[8 8]);
% % % % % % % % %             [hog2_b,visualization] = extractHOGFeatures(imgszfilt_b,'CellSize',[8 8]);
% % % % % % % % %             hog2 = cat(3,hog2_r,hog2_g,hog2_b);
% % % % % % % % %             %% Image GLCM Features
% % % % % % % % %             glcm_r = graycomatrix(img_rebs_r); 
% % % % % % % % %             glcm_g = graycomatrix(img_rebs_g); 
% % % % % % % % %             glcm_b = graycomatrix(img_rebs_b); 
% % % % % % % % %             stats_r = graycoprops(glcm_r);
% % % % % % % % %             stats_g = graycoprops(glcm_g);
% % % % % % % % %             stats_b = graycoprops(glcm_b);
% % % % % % % % %             stats = [stats_r.Contrast; stats_r.Correlation; stats_r.Energy; stats_r.Homogeneity; stats_g.Contrast; stats_g.Correlation; stats_g.Energy; stats_g.Homogeneity; stats_b.Contrast; stats_b.Correlation; stats_b.Energy; stats_b.Homogeneity];
% % % % % % % % %             Data_bs(:,j) = [img_rebs(:);hog2(:);stats;i];
% %             img_rebs_r=mapminmax(img_rebs_r(:)',-1,1)';
% %             img_rebs_g=mapminmax(img_rebs_g(:)',-1,1)';
% %             img_rebs_b=mapminmax(img_rebs_b(:)',-1,1)';
            
            Data_bs(:,j) = [img_rebs_r(:);img_rebs_g(:);img_rebs_b(:)];
            Data_tar_bs(:,j) = [1001];
        elseif i==3
            img_rec=imresize(img,[50,50]);
            img_rec_r=double(img_rec(:,:,1));
            img_rec_g=double(img_rec(:,:,2));
            img_rec_b=double(img_rec(:,:,3));
% % % % % % % % %             img_rec_r=img_rec(:,:,1);
% % % % % % % % %             img_rec_g=img_rec(:,:,2);
% % % % % % % % %             img_rec_b=img_rec(:,:,3);
% % % % % % % % %             %% Image HoG Features
% % % % % % % % %             imgszfilt_r = medfilt2(img_rec_r);
% % % % % % % % %             imgszfilt_g = medfilt2(img_rec_g);
% % % % % % % % %             imgszfilt_b = medfilt2(img_rec_b);
% % % % % % % % %             [hog3_r,visualization] = extractHOGFeatures(imgszfilt_r,'CellSize',[8 8]);
% % % % % % % % %             [hog3_g,visualization] = extractHOGFeatures(imgszfilt_g,'CellSize',[8 8]);
% % % % % % % % %             [hog3_b,visualization] = extractHOGFeatures(imgszfilt_b,'CellSize',[8 8]);
% % % % % % % % %             hog3 = cat(3,hog3_r,hog3_g,hog3_b);
% % % % % % % % %             %% Image GLCM Features
% % % % % % % % %             glcm_r = graycomatrix(img_rec_r); 
% % % % % % % % %             glcm_g = graycomatrix(img_rec_g); 
% % % % % % % % %             glcm_b = graycomatrix(img_rec_b); 
% % % % % % % % %             stats_r = graycoprops(glcm_r);
% % % % % % % % %             stats_g = graycoprops(glcm_g);
% % % % % % % % %             stats_b = graycoprops(glcm_b);
% % % % % % % % %             stats = [stats_r.Contrast; stats_r.Correlation; stats_r.Energy; stats_r.Homogeneity; stats_g.Contrast; stats_g.Correlation; stats_g.Energy; stats_g.Homogeneity; stats_b.Contrast; stats_b.Correlation; stats_b.Energy; stats_b.Homogeneity];
% % % % % % % % %             Data_c(:,j) = [img_rec(:);hog3(:);stats;i];
% %             img_rec_r=mapminmax(img_rec_r(:)',-1,1)';
% %             img_rec_g=mapminmax(img_rec_g(:)',-1,1)';
% %             img_rec_b=mapminmax(img_rec_b(:)',-1,1)';
            
            Data_c(:,j) = [img_rec_r(:);img_rec_g(:);img_rec_b(:)];
            Data_tar_c(:,j) = [1002];
        elseif i==4
            img_rei=imresize(img,[50,50]);
            img_rei_r=double(img_rei(:,:,1));
            img_rei_g=double(img_rei(:,:,2));
            img_rei_b=double(img_rei(:,:,3));
% % % % % % % % %             img_rei_r=img_rei(:,:,1);
% % % % % % % % %             img_rei_g=img_rei(:,:,2);
% % % % % % % % %             img_rei_b=img_rei(:,:,3);
% % % % % % % % %             %% Image HoG Features
% % % % % % % % %             imgszfilt_r = medfilt2(img_rei_r);
% % % % % % % % %             imgszfilt_g = medfilt2(img_rei_g);
% % % % % % % % %             imgszfilt_b = medfilt2(img_rei_b);
% % % % % % % % %             [hog4_r,visualization] = extractHOGFeatures(imgszfilt_r,'CellSize',[8 8]);
% % % % % % % % %             [hog4_g,visualization] = extractHOGFeatures(imgszfilt_g,'CellSize',[8 8]);
% % % % % % % % %             [hog4_b,visualization] = extractHOGFeatures(imgszfilt_b,'CellSize',[8 8]);
% % % % % % % % %             hog4 = cat(3,hog4_r,hog4_g,hog4_b);
% % % % % % % % %             %% Image GLCM Features
% % % % % % % % %             glcm_r = graycomatrix(img_rei_r); 
% % % % % % % % %             glcm_g = graycomatrix(img_rei_g); 
% % % % % % % % %             glcm_b = graycomatrix(img_rei_b); 
% % % % % % % % %             stats_r = graycoprops(glcm_r);
% % % % % % % % %             stats_g = graycoprops(glcm_g);
% % % % % % % % %             stats_b = graycoprops(glcm_b);
% % % % % % % % %             stats = [stats_r.Contrast; stats_r.Correlation; stats_r.Energy; stats_r.Homogeneity; stats_g.Contrast; stats_g.Correlation; stats_g.Energy; stats_g.Homogeneity; stats_b.Contrast; stats_b.Correlation; stats_b.Energy; stats_b.Homogeneity];
% % % % % % % % %             Data_i(:,j) = [img_rei(:);hog4(:);stats;i];
% %             img_rei_r=mapminmax(img_rei_r(:)',-1,1)';
% %             img_rei_g=mapminmax(img_rei_g(:)',-1,1)';
% %             img_rei_b=mapminmax(img_rei_b(:)',-1,1)';
            
            Data_i(:,j) = [img_rei_r(:);img_rei_g(:);img_rei_b(:)];
            Data_tar_i(:,j) = [1003];
        else
            img_reo=imresize(img,[50,50]);
            img_reo_r=double(img_reo(:,:,1));
            img_reo_g=double(img_reo(:,:,2));
            img_reo_b=double(img_reo(:,:,3));
% % % % % % % % %             img_reo_r=img_reo(:,:,1);
% % % % % % % % %             img_reo_g=img_reo(:,:,2);
% % % % % % % % %             img_reo_b=img_reo(:,:,3);
% % % % % % % % %             %% Image HoG Features
% % % % % % % % %             imgszfilt_r = medfilt2(img_reo_r);
% % % % % % % % %             imgszfilt_g = medfilt2(img_reo_g);
% % % % % % % % %             imgszfilt_b = medfilt2(img_reo_b);
% % % % % % % % %             [hog5_r,visualization] = extractHOGFeatures(imgszfilt_r,'CellSize',[8 8]);
% % % % % % % % %             [hog5_g,visualization] = extractHOGFeatures(imgszfilt_g,'CellSize',[8 8]);
% % % % % % % % %             [hog5_b,visualization] = extractHOGFeatures(imgszfilt_b,'CellSize',[8 8]);
% % % % % % % % %             hog5 = cat(3,hog5_r,hog5_g,hog5_b);
% % % % % % % % %             %% Image GLCM Features
% % % % % % % % %             glcm_r = graycomatrix(img_reo_r); 
% % % % % % % % %             glcm_g = graycomatrix(img_reo_g); 
% % % % % % % % %             glcm_b = graycomatrix(img_reo_b); 
% % % % % % % % %             stats_r = graycoprops(glcm_r);
% % % % % % % % %             stats_g = graycoprops(glcm_g);
% % % % % % % % %             stats_b = graycoprops(glcm_b);
% % % % % % % % %             stats = [stats_r.Contrast; stats_r.Correlation; stats_r.Energy; stats_r.Homogeneity; stats_g.Contrast; stats_g.Correlation; stats_g.Energy; stats_g.Homogeneity; stats_b.Contrast; stats_b.Correlation; stats_b.Energy; stats_b.Homogeneity];
% % % % % % % % %             Data_o(:,j) = [img_reo(:);hog5(:);stats;i];
% %             img_reo_r=mapminmax(img_reo_r(:)',-1,1)';
% %             img_reo_g=mapminmax(img_reo_g(:)',-1,1)';
% %             img_reo_b=mapminmax(img_reo_b(:)',-1,1)';
            
            Data_o(:,j) = [img_reo_r(:);img_reo_g(:);img_reo_b(:)];
            Data_tar_o(:,j) = [1004];
        end
    end
end

Data = ([Data_b Data_bs Data_c Data_i Data_o]);
Data_tar = [Data_tar_b Data_tar_bs Data_tar_c Data_tar_i Data_tar_o];

%%  Neural Network

% % % % % % % % % % % % % % % % % % % net1 = feedforwardnet([80,5],'traingdx');
% % % % % % % % % % % % % % % % % % % net1.trainParam.goal= 1e-4;
% % % % % % % % % % % % % % % % % % % net1.trainParam.min_grad= 1e-20;
% % % % % % % % % % % % % % % % % % % net1.trainParam.max_fail = 100000;
% % % % % % % % % % % % % % % % % % % net1.trainParam.epochs=100000;
% % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % TrainData = Data(1:10212,:);
% % % % % % % % % % % % % % % % % % % TrainData = Data(1:7500,:);
% % % % % % % % % % % % % % % % % % % for p=1:789
% % % % % % % % % % % % % % % % % % % TrainData(:,p) = mapminmax(TrainData(:,p)')';
% % % % % % % % % % % % % % % % % % % end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % TrainTarget = full(ind2vec(Data(10213,:)));
% % % % % % % % % % % % % % % % % % % TrainTarget = full(ind2vec(Data(7501,:)));
% % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % [net1,tr] = train(net1,TrainData,TrainTarget);

% % watershed_object_segment