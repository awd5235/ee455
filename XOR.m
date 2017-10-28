%---------------------------- XOR ------------------------------
% Purpose: Perform logical XOR of two binary images.
%
% Inputs:  Two binary images A and B.
%
% Output:  Returns a new binary image C that is the logical XOR of the two
%          inputs.
% 
function C = XOR(A,B)
    if size(A) ~= size(B) % Ensure both matrices are the same size
        return;
    else
        [M, N] = size(A); % Determine the bounds of the images
        for x = 1 : M
            for y = 1 : N
                C(x,y) = xor(A(x,y),B(x,y)); % XOR each pixel
            end
        end
    end
end