function [clusters, means] = KMeansRGB(A,seedmeans,maxIterations)
% This function splits all points in an image into a predetermined number
% of clusters. This function calls upon the functions AssignToClusters and
% UpdateMeans.
% Input: (A) A 3D array holding RGB information of an image
% Input: (seedmeans) A 3D array containing first mean values to initiate
% the function
% Input: (maxIterations) The maximum number of iterations to perform
% Output: (clusters) 2D array specifying which cluster each pixel belongs to
% Output: (means) A 3D array where each row contains the mean colour values
% for the cluster corresponding to that row number
% Author: Justin

% finding out how many means there are, therefore how many clusters
k = size(seedmeans,1);
means = seedmeans; % duplicating seedmeans but calling it means

% assigning conditions for the upcoming while loop
MeansAreSame = 0;
NoOfIterations = 0;

% The conditions for which the while loop will run in, both MeansAreSame
% and NoOfIterations have to be false and less than maxIterations
% repectively in order for while loop to continue
while MeansAreSame == 0 && NoOfIterations < maxIterations
    
    means_old = means; % saves the means to another variable for comparision later
    
    clusters = AssignToClusters(A,means); % calls upon the function AssignToClusters
    means = UpdateMeans(A,k,clusters); % calls upon the function UpdateMeans
    
    if means_old == means % checks if the new found means are EXACTLY the same as the old
        MeansAreSame = 1; % if they are the same, change the conditions of the loop
        
    else
        NoOfIterations = NoOfIterations + 1; % if they are not exactly the same, increase a counter by one
    end
    
    % checks if the number of iterations done have reached the maximum
    % specified by user, if so displays as such
    if NoOfIterations == maxIterations
        disp('Maximum number of iterations reached before convergence was achieved')
    end
end
return
