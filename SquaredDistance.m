function Dist = SquaredDistance(P,Q)
% This function calculates the straight line distance between two points in
% 3D space.
% Input: (P) & (Q) Both are an array containing three elements representing
% a point in 3D space
% Output: (D) A variable storing the straight line distance between the two
% points in 3D space
% Author: Justin

Dist = zeros(1,3); % Preallocates the size of variable, Dist

% A for loop to run calculations for each element in the array
for i = 1:length(P)
    % Finding the squared difference of two corresponding numbers elements
    Dist(i) = (P(i) - Q(i))^2; % and assigning the outcome to a new spot in 'Dist'
end

Dist = sum(Dist); % Adding all the elements up in the variable to one number
return