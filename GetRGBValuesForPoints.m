function seedmeans = GetRGBValuesForPoints(A,points)
% This function outputs a 3D array which contains RGB information of
% previously generated points.
% Input: (A) The image to fetch RGB information from
% Input: (points) A previously generated 2D array of unique points
% Output: (colours) A 3D array holding RGB values of those picked points
% Author: Justin

rows = size(points,1); % records the number of rows the 'points' array has
seedmeans = zeros(rows,1,3); % Preallocating the size of the array based on
% number of rows the array 'points' has

for i = 1:3 % A for loop to cycle through layers
    for j = 1:rows % A for loop to change row number
        
        seedmeans(j,1,i) = A(points(j,1),points(j,2),i); % Assigning specific
        % values to specific places
    end
end