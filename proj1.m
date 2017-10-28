% Adam Dykhouse, Arun Doodnauth, Kyle Schmidt
% EE455 Computer Project 1

%--------------------- Problem 1 ------------------------
% Open walkbridge image
f=imread('walkbridge.tif');
[M, N] = size(f);
    
%  Create and write a new image "f1" that is the same as the original image
%     but truncates all gray levels to a max value of 128

% downsize to 256x256
for x = 1 : 256
    for y = 1 : 256
        f1(x,y) = f(2 * x - 1,2 * y - 1); 
    end
end

% upsample to 512x512
for x = 1: 256 
    for y = 1: 256
		fout1(x*2 - 1:x*2 ,y*2 - 1:y*2) = f1(x,y);
    end
end

% Display image
imwrite(fout1,'1a.tif');

% downsize to 128x128
for x = 1 : 128
    for y = 1 : 128
        f2(x,y) = f(4 * x - 3,4 * y - 3); 
    end
end

% upsample to 512x512
for x = 1: 128 
    for y = 1: 128
		fout2(x*4 - 3:x*4 ,y*4 - 3:y*4) = f2(x,y);
    end
end

% Display image
imwrite(fout2,'1b.tif');

% downsize to 32x32
for x = 1 : 32
    for y = 1 : 32
        f3(x,y) = f(16 * x - 15,16 * y - 15); 
    end
end

% upsample to 512x512
for x = 1: 32 
    for y = 1: 32
		fout3(x*16 - 15:x*16 ,y*16 - 15:y*16) = f3(x,y);
    end
end

% Display image
imwrite(fout3,'1c.tif');



%-------------------- Problem 2 ---------------------
% Border f3 with zeros
[N,M] = size(f3);            % Get size of f3 (32 x 32)
Z = zeros(N+2,M+2);           % Create zero matrix (Z) two pixels larger than f3 in each dimension. (34x34)
Z(2:(end-1),2:(end-1)) = f3; % Center f3 inside of Zero matrix Z

% Upsample 32 x 32 to 512 x 512 using inverse distance interpolation
for x = 2:33
    for y = 2:33
        P((x-1)*16-15:(x-1)*16, (y-1)*16-15:(y-1)*16) = (Z(x-1,y-1) + Z(x-1,y+1) + Z(x+1,y-1) + Z(x+1,y+1))/4;
    end
end

P = uint8(P);       % Convert P from matrix with floating point to one with unsigned 8-bit values.
imwrite(P,'2.tif'); % Write new image to file



%---------------- Problem 3 --------------------
% Change grey level quantization to 7 bits/pixel
for x = 1 : 512	
    for y = 1 : 512
        f7p(x,y) = f(x ,y) / 2; 
    end
end
imwrite(f7p,'3-7.tif');     % Write image to file

% Change grey level quantization to 6 bits/pixel
for x = 1 : 512	
    for y = 1 : 512
        f6p(x,y) = f(x ,y) / 4; 
    end
end
imwrite(f6p,'3-6.tif');     % Write image to file

% Change grey level quantization to 5 bits/pixel
for x = 1 : 512	
    for y = 1 : 512
        f5p(x,y) = f(x ,y) / 8; 
    end
end
imwrite(f5p,'3-5.tif');     % Write image to file

% Change grey level quantization to 4 bits/pixel
for x = 1 : 512	
    for y = 1 : 512
        f4p(x,y) = f(x ,y) / 16; 
    end
end
imwrite(f4p,'3-4.tif');     % Write image to file

% Change grey level quantization to 3 bits/pixel
for x = 1 : 512	
    for y = 1 : 512
        f3p(x,y) = f(x ,y) / 32; 
    end
end
imwrite(f3p,'3-3.tif');     % Write image to file

% Change grey level quantization to 2 bits/pixel
for x = 1 : 512	
    for y = 1 : 512
        f2p(x,y) = f(x ,y) / 64; 
    end
end
imwrite(f2p,'3-2.tif');     % Write image to file

% Change grey level quantization to 1 bit/pixel
for x = 1 : 512	
    for y = 1 : 512
        f1p(x,y) = f(x ,y) / 128; 
    end
end
imwrite(f1p,'3-1.tif');     % Write image to file



%------------------- Problem 4 -------------------------
% Change spatial resolution to 256x256 and grey scale quantization
%   to 6 bits/pixel. Upsample to 512x512.
for x = 1 : 256	
    for y = 1 : 256
        f6b(2*x-1:2*x,2*y-1:2*y) = f1(x ,y)/4;  
    end
end

imwrite(f6b,'4-6.tif');     % Write image to file 
