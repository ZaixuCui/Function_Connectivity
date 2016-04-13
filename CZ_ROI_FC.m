
function CZ_ROI_FC(FunImg, Atlas_Cell, Prefix, ResultantFolder)

%
% FunImg:
%        (string)
%        full path of the 4D nifti data for one subject' functional image.
%
% Atlas_Cell:
%        (cell of strings) 
%        the atlas cell, each of which includes one mask in the gray matter
%        parcellation map
%
% Prefix:
%        (string) 
%        the prefix of the name for resultant file
%
% ResultantFolder:
%        The resultant folder storing all the resultant FC map for each
%        subject
%

%
% Written by Zaixu Cui, State Key Laboratory of Cognitive 
% Neuroscience and Learning, Beijing Normal University, 2014.
% Maintainer: zaixucui@gmail.com
%

ROI_Quantity = length(Atlas_Cell);

% Calculating mean time course for each ROI
for i = 1:ROI_Quantity
    cmd = ['fslmeants -i ' FunImg ' -m ' Atlas_Cell{i}];
    [status, result] = system(cmd); 
    disp(result);
    system('echo $PATH');
    Mean_TimeCourse(i, :) = str2num(result)';
end
if ~exist([ResultantFolder filesep 'Mean_TimeCourse'], 'dir')
    mkdir([ResultantFolder filesep 'Mean_TimeCourse']);
end
save([ResultantFolder filesep 'Mean_TimeCourse' filesep Prefix '.mat'], 'Mean_TimeCourse');

% Calculating functional connectivity between each pair of ROIs
FC = zeros(ROI_Quantity, ROI_Quantity);
FC_P = zeros(ROI_Quantity, ROI_Quantity);
for i = 2:ROI_Quantity
    for j = 1:i - 1
        [FC(i, j) FC_P(i, j)] = corr(Mean_TimeCourse(i, :)', Mean_TimeCourse(j, :)');
    end
end
if ~exist([ResultantFolder filesep 'FunConn'], 'dir')
    mkdir([ResultantFolder filesep 'FunConn']);
    mkdir([ResultantFolder filesep 'FunConn_P']);
end
save([ResultantFolder filesep 'FunConn' filesep Prefix '.mat'], 'FC');
save([ResultantFolder filesep 'FunConn_P' filesep Prefix '_P.mat'], 'FC_P');

