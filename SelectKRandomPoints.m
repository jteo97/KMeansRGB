function points = SelectKRandomPoints(A,k)

% This function generates a k by 2 array from randomly selected pixels
% from an image, A.
% Input: (A) The image to be used to pick pixels out from
% Input: (k) The number of pixels to pick out from image, A
% Output (points) This is a k number of rows and 2 column array
% with the first value of each row representing the row the pixel is in
% and the second value the column in which the pixel is housed.
% Together each row completely defines a pixel whereabouts in an image
% Author: Justin

% Assigning conditions for the upcoming while loop
count = 0;
totalrepititions = 1;

while count < totalrepititions % The conditions for which the while loop will run in
    
    % Reseting the following variables to zero as to not influence anything
    count = 0;
    totalrepititions = 0;
    
    % Generate k number of integer points ranging from 1 to how ever
    % many rows and columns there are in the image
    % A list of random row numbers stored in the first column of the variable
    % A list of random column numbers stored in the second column of the variable
    points(:,1) = randi(size(A,1),k,1);
    points(:,2) = randi(size(A,2),k,1);
    
    for i = 1:k-1 % A for loop to pick a point from the variable
        for j = i+1:k % A for loop to pick another point from the variable
            
            Y = points(i,:); % Assigning a row to a variable
            Z = points(j,:); % Assigning a different row to a variable
            
            % Checks if Z has already occured in previously
            if ismember(Y,Z,'rows')
                totalrepititions = totalrepititions + 1;
                % if it has, a counter is increased by one
                
            else % if it hasn't, both counters are increased by one
                totalrepititions = totalrepititions + 1;
                count = count + 1;
            end
        end
    end
end
return