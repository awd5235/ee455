%=========================== PROJECT 2 ===============================
% Module:  proj2.m
% 
% Usage:   Main matlab code for project 2
%
% Purpose: To understand/practice image extraction and basic logical
%          operations on binary images.
%
% Input Variables:    f - wheelnoise.gif
%                     a - match1.gif
%                     b - match2.gif
%                     c - mandril_gray.tif
%                     d - cameraman.tif
%
% Returned Results:   fthresh.gif - binary version of wheelnoise.gif
%                     fRGB.tif - colored label image of fthresh.gif
%                     fRGBc.tif - colored label image of the largest 4
%                                 connected groups of fRGB.tif
%                     2and.gif - AND of match1.gif and match2.gif
%                     2or.gif - OR of match1.gif and match2.gif
%                     2xor.gif - XOR of match1.gif and match2.gif
%                     2not.gif - NOT of match1.gif
%                     2min.gif - MIN of mandril_gray.tif and cameraman.tif
%
% Processing Flow:    1. Open image.
%                     2. Perform respective operation.
%                     3. Write result to new image.
%
% See Also:           largestN.m
%                     AND.m
%                     OR.m
%                     XOR.m
%                     NOT.m
%                     MIN.m
%
% Authors: Adam Dykhouse, Arun Doodnauth, Kyle Schmidt
% Date:    9/21/17
%
%----------------------------- Problem 1 -------------------------------
% Part A: Extract objects from grayscale image 'wheelnoise.gif' using
%   thresholding. Make sure resulting image is binary.

f = imread('wheelnoise.gif');   
fthresh = f > 64;               % Set 64 as threshold. Note fthresh is now binary.
imwrite(fthresh,'fthresh.gif');

% Part B: Find 8-connected components of image fthresh.gif
[flabel,num] = bwlabel(fthresh,8);
fRGB = label2rgb(flabel);
imwrite(fRGB,'fRGB.tif');

% Part C: Save 4 largest components of flabel and delete the rest.
% SEE "largest4.m" FOR FUNCTION DEFINITION.
label = largestN(flabel,4);
fRGBc = label2rgb(label);
imwrite(fRGBc,'fRGBc.tif');

%----------------------------- Problem 2 -------------------------------
% Part A: Write functions for AND, OR, XOR, and NOT image operators. See
% function declaration files for implementation.

% Part B: Use the functions defined in part A to perform some operations
% on the following binary images.
a=imread('match1.gif');
b=imread('match2.gif');

f1 = AND(a,b);
f2 = OR(a,b);
f3 = XOR(a,b);
f4 = NOT(a);

imwrite(f1,'2and.gif');
imwrite(f2,'2or.gif');
imwrite(f3,'2xor.gif');
imwrite(f4,'2not.gif');

% Part C: Perform the minimum or "erosion" of the following two images.
c=imread('mandril_gray.tif');
d=imread('cameraman.tif');

e = min(c,d);
imwrite(e,'2min.gif');

