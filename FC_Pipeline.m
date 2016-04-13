
function FC_Pipeline(FunImg_Cell, Atlas_Cell, Prefix_Cell, ResultantFolder, QueueOption)

%
% FunImg_Cell:
%        (cell of strings)
%        each of which is the full path of the 4D nifti data for one 
%        subject' functional image
%
% Atlas_Cell:
%        (cell of strings) 
%        each of which is the full path of one mask in the gray matter
%        parcellation map
%
% Prefix_Cell:
%        (cell of strings) 
%        each or which is the prefix of the name for resultant file
%
% ResultantFolder:
%        The resultant folder storing all the resultant FC map for each
%        subject
%
% QueueOption:
%        e.g., '-q all.q'
%

%
% Written by Zaixu Cui, State Key Laboratory of Cognitive 
% Neuroscience and Learning, Beijing Normal University, 2014.
% Maintainer: zaixucui@gmail.com
%

for i = 1:length(FunImg_Cell)
    JobName = ['FC_' num2str(i)];
    pipeline.(JobName).command = 'CZ_ROI_FC(opt.FunImg, opt.Atlas_Cell, opt.Prefix, opt.ResultantFolder)';
    pipeline.(JobName).opt.FunImg = FunImg_Cell{i};
    pipeline.(JobName).opt.Atlas_Cell = Atlas_Cell;
    pipeline.(JobName).opt.Prefix = Prefix_Cell{i};
    pipeline.(JobName).opt.ResultantFolder = ResultantFolder;
end

psom_gb_vars

Pipeline_opt.mode = 'qsub';
Pipeline_opt.qsub_options = QueueOption;
Pipeline_opt.mode_pipeline_manager = 'batch';
Pipeline_opt.max_queued = 200;
Pipeline_opt.flag_verbose = 1;
Pipeline_opt.flag_pause = 0;
Pipeline_opt.path_logs = [ResultantFolder filesep 'FC_logs'];

psom_run_pipeline(pipeline,Pipeline_opt);