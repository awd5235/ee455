%---------------------------- MIN ------------------------------
% Purpose: Perform the "erosion" of A and B. In other words, for each pixel
%          in A, compare it to the pixel at the corresponding index in B
%          and place the smaller of the two in C.
%
% Inputs:  Two binary images A and B.
%
% Output:  Returns a new binary image C that is the minimum ("erosion") of 
%          the two inputs.
% 
function C = MIN(A,B)
    if size(A) ~= size(B) % Ensure both matrices are the same size
        return;
    else
        [M, N] = size(A); % Determine the bounds of the images
        for x = 1 : M
            for y = 1 : N
                C(x,y) = min(A(x,y),B(x,y)); % XOR each pixel
            end
        end
    end
end