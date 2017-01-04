function [ mozart ] = addToMozart(fileToadd,mozart,nEch )
%ADDTOMOZART Summary of this function goes here
%   Detailed explanation goes here
myFile=eval(['load(''' fileToadd '.mat'')']);
file=eval(['myFile.' fileToadd]);
for i= 1:length(file)
    mozart.mozart(i+nEch)=mozart.mozart(i+nEch)+file(i);
end

