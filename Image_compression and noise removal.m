clc;
clear all;
close all;

img=imread('test.jpg');
[len,wid]=size(img);

imshow(img);
title("Orginal Image");
figure;
title("Orginal Image");
x=mydct2(img);
imshow(x);
title("DCT of Orignal Image");
figure;

noise=randi([1 1000],256,256);
noise=dct2(noise);

for i=128:len
    for j=128:len
        x(i,j)=x(i,j)+noise(i,j);   %Noising of an Imgage
    end
end


imshow(x);
title("DCT of NOisy Image");
figure;
y=idct2(x);
imshow(uint8(y));
title("Noisy Image");

p=dct2(y);

for i=128:len
    for j=128:len
        p(i,j)=0;
    end
end

figure;
imshow(p);
title("DCT of Denoised Image");
figure;
y=idct2(p);
imshow(uint8(y));
title("Denoised Image");
imwrite(uint8(y),"test_rec.jpg");
