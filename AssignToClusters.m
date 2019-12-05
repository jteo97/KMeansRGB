function clusters = AssignToClusters(A,means)
% This function assigns each pixel in an image to a cluster, based on which
% mean that point is closest to. It calls the function SquaredDistance.
% Input: (A) The 3D array containing an RGB image
% Input: (means) A 3D array containing the mean RGB values for each cluster
% Output: (clusters) A 2D array that contains the cluster number for each
% pixel in the image
% Author: Justin

rows = size(A,1); % variable containing how many rows our image has
cols = size(A,2); % variable containing how many columns our image has
k = size(means,1); % finding out how many means there are, therefore how many clusters
clusters = zeros(rows,cols); % preallocating the size based on number of rows and columns
ListOfDist = zeros(1,k); % preallocating the size based on number of means there are

for i = 1:rows % for loop to cycle through how ever many rows
    for j = 1:cols % for loop to cycle through how ever many columns
        for m = 1:k % for loop to cycle through how ever many means there are
            
            P = A(i,j,:); % Assigns the RGB information of a particular point to a variable
            Q = means(m,:,:); % Assigns the mean RGB values of a cluster to a variable
            
            % calls upon the SquaredDistance function to compute calculations
            ListOfDist(1,m) = SquaredDistance(P,Q);
            
            % Checks if the number of elements in the array 'ListOfDist'...
            % is equal to the number of clusters
            if length(ListOfDist) == k
                % if it is equal, picks out the place number of the smallest value
                [~,Pos] = min(ListOfDist);
                clusters(i,j) = Pos; % assigns the place number to the...
                % same point as variable 'P'
            end
            
        end
        ListOfDist = zeros(1,k); % wipes the array clean for the next run of the code
    end
end