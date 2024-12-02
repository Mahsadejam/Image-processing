clc
clear all
X=imread('cameraman.tif');
X=double(X);
% X=rgb2gray(X);
X=imresize(X,[255,255]);
n=255;
m=255;
W=zeros(n,m);
for i=1:floor(n/2)
    for j=1:m
        if j==2*i|j==2*i-1
        W(i,j)=1/2;
        end
    end
end
for i=1:n-floor(n/2)
    for j=1:m
        if j==2*i
           W(i+floor(n/2),j)=1/2;
        elseif j==2*i-1
           W(i+floor(n/2),j)=-1/2;
        end
    end
end




W=sqrt(2)*W;
X1=W*X*W';
X2=W'*X1*W;
figure(1);
subplot(1,2,1);
imagesc(X),
axis image ,colormap(gray);
subplot(1,2,2);
imagesc(X1),
axis image ,colormap(gray);
figure(2);
imagesc(X2),
axis image ,colormap(gray);
% 
% %=============================================================
% X0=XB10+XB20;
% nn=101;
% PSNR=10*log10((nn*255)^2/(norm(X0-XORS,'fro')^2))
% subplot(3,2,1);
% imagesc(X),
% axis image ,colormap(gray);
% subplot(3,2,2);
% imagesc(X1),
% axis image ,colormap(gray);
% subplot(3,2,3);
% imagesc(XRS),
% axis image ,colormap(gray);
% subplot(3,2,4);
% imagesc(X0),
% axis image ,colormap(gray);
% subplot(3,2,5);
% imagesc(XB10),
% axis image ,colormap(gray);
% subplot(3,2,6);
% imagesc(XB20),
% axis image ,colormap(gray);