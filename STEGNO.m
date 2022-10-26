clear all;
clc;
input = imread('G:\Matlab\1.jpeg');
input=rgb2gray(input);
input=imresize(input, [512 512]);
message='Thermal';
len = length(message) * 8;
ascii_value = uint8(message);
bin_message = transpose(dec2bin(ascii_value, 8));
bin_message = bin_message(:);
N = length(bin_message);
bin_num_message=str2num(bin_message);
output = input;
height = size(input, 1);
width = size(input, 2);
embed_counter = 1;
for i = 1 : height
	for j = 1 : width
		if(embed_counter <= len)
			LSB = mod(double(input(i, j)), 2);
			temp = double(xor(LSB, bin_num_message(embed_counter)));
			output(i, j) = input(i, j)+temp;
			embed_counter = embed_counter+1;
		end
		
	end
end
imwrite(input, 'G:\Matlab\originalImage.png');
imwrite(output, 'G:\Matlab\stegoImage.png');
