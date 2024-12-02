function [V] = V(k)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
V=zeros(k,1);
 for i=k:-2:1
     V(i,1)=2;
 end
 for i=k-1:-2:1
     V(i,1)=1;
 end

end

