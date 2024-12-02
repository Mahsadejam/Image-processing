

clc

[n m]=size(a)
tp=zeros(n,n)
for i=1:n
tp(i,k)=a(i)
end

for i=k+1:n
for j=1:i-k
tp(j,i)=0;
end
for j=i-k+1:n
    
   
    
tp(j,i)=a(j-i+k)

   end
end
for i=k-1:-1:1
    for j=n:-1:n-i+1
  
        
   
        tp(j,i)=0;
    end
    for j=n-i:-1:1
        tp(j,i)=a(i+j)
    end
    
end

