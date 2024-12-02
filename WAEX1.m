clc
clear all
load('A1.mat');
load('B1.mat');
H1=B1;
H2=A1;
X=imread('cameraman.tif');
% X=rgb2gray(X);
X=imresize(X,[255,255]);
P1=fspecial('motion',4,180);
X=double(X);
XORS=zeros(101,101);
XORS=X(30:130,90:190);
%============================
X1=imfilter(X,P1);
E=randn(size(X1));
E=E/norm(E,'fro');
X1=X1+0.001*norm(X1,'fro')*E;
%=========================================
% imshow(uint8(X1));

%===============================
XRS=zeros(101,101);
XRS=X1(30:130,90:190);
P=zeros(101,101);
P(51,49:53)=P1;
%========================================
n=101;
k=51;
Ac=AD(k,n);
Rj=chol(Ac);
Ri=Rj';
PR=Ri*P*Rj';
[U,S,V]=svd(PR);
k=1;
a=sqrt(S(k,k))*inv(Ri)*U(:,k); 
b=sqrt(S(k,k))*inv(Rj)*V(:,k);
At=toep(a,51);
Ah=hnkelnew(a,51);
Ar=r2corr(a,51);
Bt=toep(b,51);
Bh=hnkelnew(b,51);
Br=r2corr(b,51);
%===========================
A1=At-Ah+Ar;
B1=Bt-Bh+Br;
%===========================
A1=At-Ah+Ar;
B1=Bt-Bh+Br;
%====  haar wavelet reflexive
H1=B1;
H2=A1;
%=======================

%========= reflexive
% H1=A1;
% H2=B1;
% X=imread('cameraman.tif');
% X=double(X);
[n,m]=size(XRS);
%==========================
Xb=XRS;
% imshow(uint8(Xb))
% imshow(uint8(W'*Xb*W))
k=20;
s=n;
% Hn1=H1'*H1;
% Hn2=H2'*H2;
% Xb=H1'*Xb*H2;
% H1=Hn1;
% H2=Hn2;
%===========================
%===================== HAAR =======================
W=zeros(101,101);
for i=1:50
    for j=1:101
        if j==2*i|j==2*i-1
        W(i,j)=1/2;
        end
    end
end
for i=1:51
    for j=1:101
        if j==2*i
           W(i+50,j)=1/2;
        elseif j==2*i-1
           W(i+50,j)=-1/2;
        end
    end
end
W=sqrt(2)*W;
%=================================================
H1=H1*W';
H2=H2*W';
%=========================
G=Xb;
X0=W*Xb*W';
V=zeros(n,(k)*s);
h=zeros(k+1,k);
for ff=1:30
    R0=G-H1*X0*H2';
    beta=norm(R0,'fro');
    V1=R0./beta;
    V(:,1:s)= V1;
    for j=1:k;
        Vb=H1*V(:,((j-1)*s)+1:j*s)*H2';
        for i=1:j;
            h(i,j)=trace(Vb'*V(:,(i-1)*s+1:i*s));
            Vb=Vb-h(i,j)*V(:,(i-1)*n+1:i*n);
       end
        h(j+1,j)=norm(Vb,'fro');
        V(:,(j*s)+1:(j+1)*s)=Vb/h(j+1,j);
    end
%===============================================    
[U1,S1,V1]=svd(h);
S=zeros(k,1);
for i=1:k
    S(i,1)=S1(i,i);
end
f=zeros(k,1);
for i=1:k
    f(i,1)=U1(1,i);
end
 mo=fminbnd(@(mo) (beta^2)*((sum((mo^2)*f./((S.^2)+(mo^2))).^2)+(U1(1,k+1)^2))...
     /((sum((mo.^2)./((S.^2)+(mo^2)))+1)^2),0,0.01);
disp(mo);
 %==========================================================================
be=zeros(k+1,1);
be(1,1)=beta;
y=pinv(h'*h+(mo^2)*eye(k,k))*h'*be;
Vk=V(:,1:k*n);
X0=X0+Vk*(kron(y,eye(n,n)));
end
X0=W'*X0*W;
nn=101;
PSNR=10*log10((nn*255)^2/(norm(X0-XORS,'fro')^2))
subplot(3,2,1);
imagesc(X),
axis image ,colormap(gray);
subplot(3,2,2);
imagesc(X1),
axis image ,colormap(gray);
subplot(3,2,3);
imagesc(XRS),
axis image ,colormap(gray);
subplot(3,2,4);
imagesc(X0),
axis image ,colormap(gray);
subplot(3,2,5);
imagesc(XB10),
axis image ,colormap(gray);
subplot(3,2,6);
imagesc(XB20),
axis image ,colormap(gray);