
clc
clear all
W=imread('cameraman.tif');
W=double(W);
%=======================  P ===========
psf= fspecial('motion',11,180);
[n,m]=size(psf);
P=zeros(256,256);
% P(128:128+n-1,128:128+m-1)=psf;
P(128,123:133)=psf;
% B=uint8(A);
% figure,
% imagesc(A),
% axis image,
% colormap(gray)
WW=conv2(W,P);
WW2=imfilter(W,P);
% imshow(uint8(WW2))
%========================================
n=256;
k=128;
Ac=AD(k,n);
Rj=chol(Ac);
Ri=Rj';
PR=Ri*P*Rj';
[U,S,V]=svd(PR);
for k=1:2
   a=sqrt(S(k,k))*inv(Ri)*U(:,k); 
   b=sqrt(S(k,k))*inv(Rj)*V(:,k);
    At=toep(a,128);
   Ah=hnkelnew(a,128);
   Ar=r2corr(a,128);
   Bt=toep(b,128);
   Bh=hnkelnew(b,128);
   Br=r2corr(b,128);
%===========================
A1(1:256,1+(k-1)*256:k*256)=At-Ah+Ar;
B1(1:256,1+(k-1)*256:k*256)=Bt-Bh+Br;
%==============================
end
WQ=zeros(256,256);
for k=1:2
    WQ=WQ+B1(1:256,1+(k-1)*256:k*256)*W*A1(1:256,1+(k-1)*256:k*256)';
end
imshow(uint8(WQ))
% figure,
% imagesc(WQ),
% axis image,
% colormap(gray)
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
