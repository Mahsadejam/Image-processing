clc
clear all
X=imread('Airplane.tiff');
X=imresize(X,[255,255]);
X=double(X);
%============================
P1=fspecial('motion',4,180);
% imshow(uint8(X1));
%============================
X1=imfilter(X,P1);
for i=1:3
E(:,:,i)=randn(size(X1(:,:,i)));
E(:,:,i)=E(:,:,i)/norm(E(:,:,i),'fro');
X1(:,:,i)=X1(:,:,i)+0.001*norm(X1(:,:,i),'fro')*E(:,:,i);
end
%=========================================
% imshow(uint8(X1));
%===============================
XRS=zeros(101,101,3);
for i=1:3
XRS(:,:,i)=X1(30:130,90:190,i);
end
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
%========= reflexive
for t=1:3
H1=A1;
H2=B1;
% X=imread('cameraman.tif');
% X=double(X);
[n,m]=size(XRS(:,:,t));
%==========================
Xb=XRS(:,:,t);
%========================
k=30;
s=n;
G=Xb;
X0=G;
for ff=1:70
    R0=G-H1*X0*H2';
    beta=norm(R0,'fro');
    V1=R0./beta;
    V=zeros(n,(k)*s);
    h=zeros(k+1,k);
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
[U1,S1,V1]=svd(h,0);
S=zeros(k,1);
for i=1:k
    S(i,1)=S1(i,i);
end
f=zeros(k,1);
for i=1:k
    f(i,1)=U1(1,i);
end
 mo=fminbnd(@(mo) (beta^2)*((sum((mo^2)*f./((S.^2)+(mo^2))).^2)+(U1(k+1,1)^2))...
     /((sum((mo.^2)./((S.^2)+(mo^2)))+1)^2),min(S),max(S));
disp(mo);
 %==========================================================================
be=zeros(k+1,1);
be(1,1)=beta;
y=pinv(h'*h+(mo^2)*eye(k,k))*h'*be;
Vk=V(:,1:k*n);
X0=X0+Vk*(kron(y,eye(n,n)));
end   
XN(:,:,t)=X0;
end
subplot(3,2,1);
imshow(uint8(X));
% imagesc(X),
% axis image ,colormap(gray);
subplot(3,2,2);
imshow(uint8(X1));
% imagesc(X1),
% axis image ;
subplot(3,2,3);
imshow(uint8(XRS));
% imagesc(XRS),
% axis image ,colormap(gray);
subplot(3,2,4);
imshow(uint8(XN));
% imagesc(XN),
% axis image ,colormap(gray);