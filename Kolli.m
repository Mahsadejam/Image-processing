clc
clear all
k=4;
B=zeros(10,10)
for i=1:k-1
    j=1:k-1
A11=zeros(k-1,k-1);
A11(k-1,k-1)=n+4;
for i=3:2:k-1
   A11(k-i,k-1)=5;
end
for i=2:2:k-1
    A11(k-i,k-1)=6;
end
for l=k-2:-1:1
    A11(1:l,l)=A11(2:l+1,l+1)+4*ones(l,1);
end
B