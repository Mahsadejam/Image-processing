function [ A ] = toep(a,k )
%k== integer number and a=column matrix
%   Detailed explanation goes here
[n m]=size(a);
A=zeros(n,n);
Z=zeros(n,n);
for i=1:n-1
    Z(i,i+1)=1;
end
for i=1:k;
    A(:,i)=(Z^(k-i))*a;
end
 for i=k+1:n;
     A(:,i)=((Z')^(i-k))*a;
 end
end

