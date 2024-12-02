function [ A ] = r2corr( a,k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[n m]=size(a);
A=zeros(n,n);
Z=zeros(n,n);
for i=1:n-1
    Z(i,i+1)=1;
end
C=(Z^(k-1));
for l=k:n-1;
    C=C+2*(Z^(l));
end
R=(Z^(n-k))';
for i=n-k+1:n-1;
    R=R+2*(Z^(i))';
end
A(:,1)=C*a;
A(:,n)=R*a;
end

