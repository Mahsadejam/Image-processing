function [W] = W(k)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
W=zeros(k,1);
for i=1:2:k
    W(i,1)=2;
end
for i=2:2:k
    W(i,1)=1;
end

end

