function [] = LoadFile( filename )
%LOADFILE Summary of this function goes here
%   Detailed explanation goes here
myFile=eval(['load(''' filename '.mat'')']);
mylength=length(eval(['myFile.' filename]));

N_v = 0:mylength-1;
Nfft = 256;

% file=eval(['myFile.' filename]);
% figure, 
% subplot 211
% %représentation temporelle
% plot(N_v,file);
% xlim([0 5000-1]); %limite valeurs de x
% xlabel('Numéro échantillon');
% ylabel('s(t)');

% subplot 212
% var=256;
% spectrogram(file,rectwin(var),var/2,Nfft,myFile.fe,'yaxis');


mozart=addToMozart('Instru1',myFile,300);


soundsc(mozart.mozart,mozart.fe);
end

