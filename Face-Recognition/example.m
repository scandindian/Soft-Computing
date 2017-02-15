                 
clear all
clc
close all

TrainDatabasePath = uigetdir('G:\Academics\6 semester\Soft Computing\Face-Recognition-master', 'Select training database path' );
TestDatabasePath = uigetdir('G:\Academics\6 semester\Soft Computing\Face-Recognition-master', 'Select test database path');

prompt = {'Enter test image name (a number between 1 to 10):'};
dlg_title = 'Input of PCA-Based Face Recognition System';
num_lines= 1;
def = {'1'};

TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
im = imread(TestImage);

T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

subplot(1,2,1), subimage(im), title('Test Image');
subplot(1,2,2), subimage(SelectedImage), title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
