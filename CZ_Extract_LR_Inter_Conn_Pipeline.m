
function CZ_Extract_LR_Inter_Conn_Pipeline(ConnFile_Cell, ResultantFolder)

if ~exist(ResultantFolder, 'dir')
    mkdir(ResultantFolder);
end

for i = 1:length(ConnFile_Cell)
    ConnMatrix = load(ConnFile_Cell{i});
    FieldName = fieldnames(ConnMatrix);
    
    [Left_Vector(i, :) InterHemis_Vector(i, :) Right_Vector(i, :)] = CZ_Extract_LR_Inter_Conn(ConnMatrix.(FieldName{1}));
end

save([ResultantFolder filesep 'Left_Vector.mat'], 'Left_Vector');
save([ResultantFolder filesep 'InterHemis_Vector.mat'], 'InterHemis_Vector');
save([ResultantFolder filesep 'Right_Vector.mat'], 'Right_Vector');

