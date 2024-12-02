function [ A ] = hnkelnew( a,k )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[n m]=size(a);
ar=zeros(1,n);
ac=zeros(n,1);
for i=1:n-k+1
    ar(1,i)=a(k+(i-1),1);
end
for i=1:k
    ac(n-k+i,1)=a(i,1);
end  
 A=hankel(ar',ac');
end

