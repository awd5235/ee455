%---------------------------- AND ------------------------------
% Purpose: Perform logical AND of two binary images.
%
% Inputs:  Two binary images A and B.
%
% Output:  Returns a new binary image C that is the logical AND of the two
%          inputs.
% 
function C = AND(A,B)
    if size(A) ~= size(B) % Ensure both matrices are the same size
        return;
    else
        [M, N] = size(A); % Determine the bounds of the images
        for x = 1 : M
            for y = 1 : N
                C(x,y) = A(x,y) & B(x,y); % AND each pixel
            end
        end
    end
end