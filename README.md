# Function_Connectivity
Matlab code for calculating functional connectivity  

PSOM (https://github.com/PSOM) is needed to run this program.  

CZ_ROI_FC.m is a function to calculate functional connectivity.  
FC_Pipeline.m is a function, which call the CZ_ROI_FC.m and can parallelize a number of jobs.

CZ_Extract_LR_Inter_Conn.m and CZ_Extract_LR_Inter_Conn_2.m are used to extract the functional connectiviety in the left, left hemisphere and interhemis, and then store all the values in a vector for each subject.



