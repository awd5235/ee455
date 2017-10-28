%=========================== PROJECT 3 ===============================
% Module:  mainproj3.m
% 
% Usage:   Main matlab code for project 3
%
% Purpose: Basic image frequency analysis and filtering
%
% Input Variables:  f - input 2D image
%                   M, N - rows (M) and columns in f   
%
% Returned Results: H - A filtered version of input image  
%
% Processing Flow:  Do M x N unpadded operations
%                   1.  M x N FFT of f --> F
%                   2.  Get Gaussian M x N LPF
%                   3.  Filter f (F) with g (G)
%                   4.  Do IFFT
%                   --> Clear wraparound errors at top, bottom
%                   left, right visible in filtered checkers image
%
% See Also:  lpfilter.m   
%            dftuv.m          
%
% Authors:   Adam Dykhouse, Arun Doodnauth, Kyle Schmidt
% Date:      10/16/17
%
%----------------------------- Problem 1 -------------------------------
% Part A: Display unmodulated and modulated fourier transform. Then take
% the inverse transform to display transformed image.

% Initialize checkered image f
f=imread('checker.gif');
[M, N] = size(f);                   % Determine size MxN
imtool(f,[]);                       % Display the image

% Determine unmodulated MxN FFT of f --> F
F = fft2(double(f));
imtool(abs(F));                     % Display magnitude |F(u,v)|
imtool(log(1+abs(F)),[]);           % Display log(1+|F(u,v)|)

% Determine modualted image fm = (-1)^(x+y)f(x,y)
fm = zeros(M,N);
for x = 1 : M
    for y = 1 : N
        fm(x,y) = ((-1)^(x+y))*f(x,y);
    end
end
imtool(fm);

% Determine modulated MxN FFT of fm --> Fm
Fm = fft2(double(fm));
imtool(abs(Fm),[]);                 % Display magnitude |Fm(u,v)|
imtool(log(1+abs(Fm)),[]);          % Display log(1+|Fm(u,v)|)

% Determine transformed image g(x,y)
Fm(1,1) = 0.0;
g = ifft2(Fm);
imtool(real(g),[]);

% Part B: Perform unpadded lowpass filtering of checkered image. Display
% 3-d plot of |H(u,v)|, log(1+|G(u,v)|), and g(x,y)
sig = 15.5;
H   = lpfilter('gaussian', M, N, sig);

%mesh(H(1:5:256, 1:5:256));          % Make 3D plot of H(u,v)
for u = 1 : M
    for v = 1 : N
        G(u,v) = H(u,v)*F(u,v);      % Convolve H and F to find G
    end
end
imtool(log(1+abs(G)),[]);            % Display G(u,v)

g = ifft2(G);                        % Determine time domain g(x,y)
for x = 1 : M
    for y = 1 : N
        gm(x,y) = ((-1)^(x+y))*g(x,y);  % Modulate g(x,y) to get gm(x,y)
    end
end
imtool(gm);                          % Display gm(x,y)
 
% Part C: Repeat part B using appropriate zero padding
P = 2 * M;
Q = 2 * N;
F   = fft2(double(f), P, Q);

sig = 7.5;
H   = lpfilter('gaussian', P, Q, 2*sig);

for u = 1 : P
    for v = 1 : Q
        G(u,v) = double(H(u,v))*double(F(u,v)); % Determine G(u,v)
    end
end
imtool(log(1+abs(G)),[]);            % Display G(u,v)

g = ifft2(G);                        % Determine time domain g(x,y)
for x = 1 : P
    for y = 1 : Q
        gm(x,y) = ((-1)^(x+y))*g(x,y);  % Modulate g(x,y) to get gm(x,y)
    end
end
imtool(gm);                          % Display gm(x,y)


%----------------------------- Problem 2 -------------------------------


