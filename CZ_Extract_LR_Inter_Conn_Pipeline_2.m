
function CZ_Extract_LR_Inter_Conn_Pipeline_2(ConnFile_Cell, ResultantFolder, Left_Index, Right_Index)

if ~exist(ResultantFolder, 'dir')
    mkdir(ResultantFolder);
end

for i = 1:length(ConnFile_Cell)
    ConnMatrix = load(ConnFile_Cell{i});
    FieldName = fieldnames(ConnMatrix);
    
    [Left_Vector(i, :) InterHemis_Vector(i, :) Right_Vector(i, :)] = CZ_Extract_LR_Inter_Conn_2(ConnMatrix.(FieldName{1}), Left_Index, Right_Index);
end

save([ResultantFolder filesep 'Left_Vector.mat'], 'Left_Vector');
save([ResultantFolder filesep 'InterHemis_Vector.mat'], 'InterHemis_Vector');
save([ResultantFolder filesep 'Right_Vector.mat'], 'Right_Vector');

