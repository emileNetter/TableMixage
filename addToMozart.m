function [ mozart ] = addToMozart(fileToAdd,mozart,nEch )
%ADDTOMOZART Summary of this function goes here
%   Detailed explanation goes here
myFile=eval(['load(''' fileToAdd '.mat'')']);
file=eval(['myFile.' fileToAdd]);
for i= 1:length(file)
    mozart.mozart(i+nEch)=mozart.mozart(i+nEch)+file(i);
end

