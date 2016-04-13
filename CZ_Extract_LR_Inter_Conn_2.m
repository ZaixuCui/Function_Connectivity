
function [Left_Vector InterHemis_Vector Right_Vector] = CZ_Extract_LR_Inter_Conn_2(Connection_Matrix, Left_Index, Right_Index)

%
% Connection_Matrix: m*m matrix
%                    the first half ROIs are in the left hemisphere
%                    the second half ROIs are in the right hemisphere
%
% Left_Index:
%           Array with the ID of ROIs in the left hemisphere
%
% Right_Index:
%           Array with the ID of ROIs in the right hemisphere
%

[ROI_Quantity, ~] = size(Connection_Matrix);

Left_Matrix = Connection_Matrix(Left_Index, Left_Index);
InterHemis_Matrix = Connection_Matrix(Left_Index, Right_Index);
Right_Matrix = Connection_Matrix(Right_Index, Right_Index);

tmp_left = ones(length(Left_Index));
TrilMatrix_left = tril(tmp_left, -1);
TrilIndex_left = find(TrilMatrix_left);

tmp_right = ones(length(Right_Matrix));
TrilMatrix_right = tril(tmp_right, -1);
TrilIndex_right = find(TrilMatrix_right);

tmp_Interhemis = ones(length(Left_Index), length(Right_Index));


Left_Vector = Left_Matrix(TrilIndex_left);
InterHemis_Vector = InterHemis_Matrix(find(tmp_Interhemis));
Right_Vector = Right_Matrix(TrilIndex_right);
