
clc
clear all
load('A1.mat');
load('B1.mat');
H1=B1;
H2=A1;
X=imread('cameraman.tif');
% X=rgb2gray(X);
X=imresize(X,[255,255]);
P1=fspecial('motion',11,180);
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
figure(1);
subplot(1,2,1)
imshow(uint8(XRS))
subplot(1,2,2)
imshow(uint8(H1*XORS*H2'))

% P=zeros(101,101);
% P(51,46:56)=P1;
% %========================================
% n=101;
% k=51;
% Ac=AD(k,n);
% Rj=chol(Ac);
% Ri=Rj';
% PR=Ri*P*Rj';
% [U,S,V]=svd(PR);
% k=1;
% a=sqrt(S(k,k))*inv(Ri)*U(:,k); 
% b=sqrt(S(k,k))*inv(Rj)*V(:,k);
% At=toep(a,51);
% Ah=hnkelnew(a,51);
% Ar=r2corr(a,51);
% Bt=toep(b,51);
% Bh=hnkelnew(b,51);
% Br=r2corr(b,51);
% %===========================
% A1=At-Ah+Ar;
% B1=Bt-Bh+Br;
% %===========================
% A1=At-Ah+Ar;
% B1=Bt-Bh+Br;
% %========= reflexive
% H1=A1;
% H2=B1;
% % X=imread('cameraman.tif');
% % X=double(X);
% [n,m]=size(XRS);
% %==========================
% Xb=XRS;
% XB1=Xb;
% 
% % %%%%%%%%%%%%%%%%%========================
% % 
% % Hn1=H1'*H1;
% % Hn2=H2'*H2;
% % Xb=H1'*Xb*H2;
% % H1=Hn1;
% % H2=Hn2;
% 
% WN=12;
% Wk=12;
% s=n;
% WV=zeros(n,(Wk)*s);
% Wh=zeros(Wk+1,Wk);
% WG=XB1;
% XB10=WG;
% 
% 
% for ff=1:WN
%     WR0=WG-H1*XB10*H2';
%     Wbeta=norm(WR0,'fro');
%     WV1=WR0./Wbeta;
%     WV(:,1:s)=WV1;
%     for j=1:k;
%         WVb=H1*WV(:,((j-1)*s)+1:j*s)*H2';
%         for i=1:j;
%             Wh(i,j)=trace(WVb'*WV(:,(i-1)*s+1:i*s));
%             WVb=WVb-Wh(i,j)*WV(:,(i-1)*n+1:i*n);
%        end
%         Wh(j+1,j)=norm(WVb,'fro');
%         WV(:,(j*s)+1:(j+1)*s)=WVb/Wh(j+1,j);
%     end
% %===============================================    
% [WU1,WS1,WV1]=svd(Wh);
% WS=zeros(Wk,1);
% for i=1:k
%     WS(i,1)=WS1(i,i);
% end
% Wf=zeros(Wk,1);
% for i=1:Wk
%     Wf(i,1)=WU1(1,i);
% end
%  Wmo=fminbnd(@(Wmo) (Wbeta^2)*((sum((Wmo^2)*Wf./((WS.^2)+(Wmo^2))).^2)+(WU1(1,Wk+1)^2))...
%      /((sum((Wmo.^2)./((WS.^2)+(Wmo^2)))+1)^2),0,0.01);
% disp(Wmo);
%  %==========================================================================
% Wbe=zeros(Wk+1,1);
% Wbe(1,1)=Wbeta;
% Wy=pinv(Wh'*Wh+(Wmo^2)*eye(Wk,Wk))*Wh'*Wbe;
% WVk=WV(:,1:Wk*n);
% XB10=XB10+WVk*(kron(Wy,eye(n,n)));
% end  
% 
% % %======================XB1
% % 
% % for ff=1:TN
% %     TR0=TG-H1*XB20*H2';
% %     Tbeta=norm(TR0,'fro');
% %     TV1=TR0./Tbeta;
% %     TV(:,1:s)=TV1;
% %     for j=1:k;
% %         TVb=H1*TV(:,((j-1)*s)+1:j*s)*H2';
% %         for i=1:j;
% %             Th(i,j)=trace(TVb'*TV(:,(i-1)*s+1:i*s));
% %             TVb=TVb-Th(i,j)*TV(:,(i-1)*n+1:i*n);
% %        end
% %         Th(j+1,j)=norm(TVb,'fro');
% %         TV(:,(j*s)+1:(j+1)*s)=TVb/Th(j+1,j);
% %     end
% % %===============================================    
% % [TU1,TS1,TV1]=svd(Th);
% % TS=zeros(k,1);
% % for i=1:k
% %     TS(i,1)=TS1(i,i);
% % end
% % Tf=zeros(k,1);
% % for i=1:k
% %     Tf(i,1)=TU1(1,i);
% % end
% %  Tmo=fminbnd(@(Tmo) (Tbeta^2)*((sum((Tmo^2)*Tf./((TS.^2)+(Tmo^2))).^2)+(TU1(1,Tk+1)^2))...
% %      /((sum((Tmo.^2)./((TS.^2)+(Tmo^2)))+1)^2),0,0.01);
% % disp(Tmo);
% %  %==========================================================================
% % Tbe=zeros(Tk+1,1);
% % Tbe(1,1)=Tbeta;
% % Ty=pinv(Th'*Th+(Tmo^2)*eye(Tk,Tk))*Th'*Tbe;
% % TVk=TV(:,1:Tk*n);
% % XB20=XB20+TVk*(kron(Ty,eye(n,n)));
% % end  
% % %=============================================================
% X0=XB10;
% nn=101;
% PSNR=10*log10((nn*255)^2/(norm(X0-XORS,'fro')^2))
% PP=zeros(51,51);
% PP(26,21:31)=P1;
% PP=double(PP);
% EK=norm(X0-XORS,'fro')/norm(XORS,'fro')
% 
% Xvv=X;
% Xvv(30,90:190)=0;
% Xvv(130,90:190)=0;
% Xvv(30:130,90)=0;
% Xvv(30:130,190)=0;
% figure(1)
% subplot(1,3,1);
% imshow(uint8(Xvv)),
% title('(a) Original image')
% subplot(1,3,2);
% imagesc(PP),
% axis image ,colormap(gray);
% title('(b) Motion blur PSF')
% subplot(1,3,3);
% imshow(uint8(X1)),
% title('(c) Blurred and noisy image')
% 
% figure(2)
% subplot(1,2,1);
% imshow(uint8(XRS)),
% title('(a) Blurred and noisy image')
% subplot(1,2,2);
% imshow(uint8(X0)),
% title('(b) Restored image')
% 
% imwrite(uint8(Xvv),'Ex1A11.png');
% imwrite(PP,'Ex1A12.png');
% imwrite(uint8(X1),'Ex1A13.png');
% 
% 
% 
% figure(3)
% subplot(2,2,1);
% imagesc(X),
% axis image ,colormap(gray);
% subplot(2,2,2);
% imagesc(X1),
% axis image ,colormap(gray);
% subplot(2,2,3);
% imagesc(XRS),
% axis image ,colormap(gray);
% subplot(2,2,4);
% imagesc(X0),
% axis image ,colormap(gray);
% % subplot(3,2,5);
% % imagesc(XB10),
% % axis image ,colormap(gray);
% % subplot(3,2,6);
% % imagesc(XB20),
% % axis image ,colormap(gray);