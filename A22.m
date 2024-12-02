function [A22] = A22( k,n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
A22=zeros(n-k,n-k);
A22(1,1)=n+4;
for i=2:2:n-k
    A22(i,1)=6;
end
for i=3:2:n-k-1
    A22(i,1)=5;
end
for l=2:n-k
    A22(l:n-k,l)=A22(l-1:n-k-1,l-1)+4*ones(n-k-l+1,1);
end
for i=1:n-k-1
     for j=2:n-k
        A22(i,j)=A22(j,i);
     end
end
end

