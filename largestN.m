%---------------------------- largestN ------------------------------
% Purpose: Erase all but the largest N components of a labeled binary image.
%
% Inputs:  A matrix containing the 8-connected groups of a binary image.
%          Poisitve integer N specifying the N-th largest connected groups
%          to select.
%
% Output:  Returns a new binary label matrix the size of the input matrix that
%          retains the same values for the N largest 8-connected groups as
%          the input matrix, but all other pixels are set to 0.
% 
function label = largestN(flabel, N)
    props = regionprops(flabel, 'Area', 'PixelIdxList'); % Get the are and pixel index region properties of flabel
    [sorted,idx] = sort([props.Area], 'descend');        % Sort Areas by decreasing size
    props = props(idx);                                  % Props now contains the connected region sizes in descending order
    label = false(size(flabel));                         % Create a new empty matrix the size of the original input
    for i=1:N
        label(props(i).PixelIdxList) = true;    % Set all pixels in first N regions of props to 1
    end
end
