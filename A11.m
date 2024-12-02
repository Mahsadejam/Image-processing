function [ A11 ] = A11( k,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
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
for i= 1:k-2
  for j=1:k-2
    A11(k-i,j)=A11(j,k-i);
   end
end
end

