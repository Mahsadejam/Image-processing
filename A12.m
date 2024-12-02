function [ A12 ] = A12(k,n)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
s1=zeros(k-1,1);
for i=k-1:-2:1
s1(i,1)=-1;
end
s1(k-1,1)=-2;
s2=zeros(1,n-k);
for i=1:2:n-k
  s2(1,i)=-1;
end
s2(1,1)=-2;

  A12 =hankel(s1,s2);
end

