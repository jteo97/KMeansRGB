function myimage = CreateKColourImage(clusters,means)
% This function assigns a pixel new RGB values based on which cluster that
% pixel belongs to. The values that are used are mean colour values for
% that cluster.
% Input: (clusters) A 2D array with m rows and n columns, specifying which
% cluster each pixel belongs to
% Input: (means) A 3D array with k rows, 1 column and 3 layers
% Output: (myimage) A 3D array of unsigned 8 bit integers together forming
% an RGB image
% Author: Justin

means = round(means); % rounds all non integers to integers
% Preallocates size of output depending on the size of variable 'clusters'
myimage = zeros(size(clusters,1),size(clusters,2),3);

for i = 1:3 % changing layer number (1=red, 2=green, 3=blue)
    for j = 1:size(clusters,1) % changing row number
        for k = 1:size(clusters,2) % changing column number
            
            % assigning the RGB value of a point in the variable 'clusters'
            % to the same point in 'myimage'
            myimage(j,k,i) = means(clusters(j,k),:,i); 
        end
    end
end

myimage = uint8(myimage); % converting myimage to unsigned 8-bit integers

return

