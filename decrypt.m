clc          
    s = imread('G:\Matlab\stegoImage.png');             
     height = size(s,1);          
     width = size(s,2);         
    m = 64;       
    k = 1;      
    for i = 1 : height
        for j = 1 : width
            if (k <= m)
                b(k) = mod(double(s(i,j)),2);
                k = k + 1;
            end
        end
    end
 binaryVector = b;      
 binValues = [ 128 64 32 16 8 4 2 1 ];      
 binaryVector = binaryVector(:);
    if mod(length(binaryVector),8) ~= 0
        error('Length of binary vector must be a multiple of 8.');
    end
    binMatrix = reshape(binaryVector,8,8);
    textString = char(binValues*binMatrix);    
    disp(textString);