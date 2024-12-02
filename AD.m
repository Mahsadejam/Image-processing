function [ A ] = AD( k,n );
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
A=zeros(n,n);
A(1:k-1,1:k-1)=A11(k,n);
A(1:k-1,k+1:n)=A12(k,n);
A(k+1:n,1:k-1)=A12(k,n)';
A(k+1:n,k+1:n)=A22(k,n);
%=================
A(k,k)=n;
%==================
A(1:k-1,k)=V(k-1);
A(k+1:n,k)=V(n-k);
A(k,1:k-1)=W(k-1)';
A(k,k+1:n)=W(n-k)';

end

