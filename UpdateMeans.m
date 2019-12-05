function means = UpdateMeans(A,k,clusters)
% This function calculates the mean RGB values for each cluster
% Input: (A) 3D array depicting an RGB image
% Input: (k) A previously keyed number representing how many clusters there are
% Input: (clusters) 2D array that specifies which cluster each pixel belongs to
% Output: (means) A 3D array where each row contains the mean colour values
% for the cluster corresponding to that row number
% Author: Justin

means = zeros(k,1,3); % Preallocating the size of means based on k rows

for i = 1:3 % for loop to cycle through layers
    layer = A(:,:,i); % assigning the values of a layer of the image to a variable
    
    for j = 1:k % a for loop to go through each cluster
        % find the position of all values belonging to a cluster number
        PosOfCluster = find(clusters == j);
        % finds the RGB mean value of all the numbers belonging to a cluster
        means(j,:,i) = mean(layer(PosOfCluster));
    end
end
return