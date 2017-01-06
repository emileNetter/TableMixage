function [ h ] = fonctionDeTransfert( g,M,k0 )
h=[1];
for i = 1:k0
    h = [h(1:end) 0];
end

for j = 0:M-1
    h= [h(1:end) g/M];
end
end

