
function [Left_Vector InterHemis_Vector Right_Vector] = CZ_Extract_LR_Inter_Conn(Connection_Matrix)

%
% Connection_Matrix: m*m matrix
%                    the first half ROIs are in the left hemisphere
%                    the second half ROIs are in the right hemisphere
%

[ROI_Quantity, ~] = size(Connection_Matrix);

Left_Matrix = Connection_Matrix([1 : ROI_Quantity/2], [1 : ROI_Quantity/2]);
InterHemis_Matrix = Connection_Matrix([ROI_Quantity/2 + 1 : ROI_Quantity], [1 : ROI_Quantity/2]);
Right_Matrix = Connection_Matrix([ROI_Quantity/2 + 1 : ROI_Quantity], [ROI_Quantity/2 + 1 : ROI_Quantity]);

tmp = magic(ROI_Quantity/2);
TrilMatrix = tril(tmp, -1);
TrilIndex = find(TrilMatrix);

Left_Vector = Left_Matrix(TrilIndex);
InterHemis_Vector = InterHemis_Matrix(find(tmp));
Right_Vector = Right_Matrix(TrilIndex);
