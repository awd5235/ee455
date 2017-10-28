%---------------------------- NOT ------------------------------
% Purpose: Perform logical inversion (NOT) of a binary image.
%
% Inputs:  Binary image A
%
% Output:  Returns a new binary image B that is the logical inverse of the
%          input.
% 
function B = NOT(A)
    [M,N] = size(A);
    for x = 1:M
        for y = 1:N
            B(x,y) = ~A(x,y); % Flip the bit of each pixel in A
        end
    end
end