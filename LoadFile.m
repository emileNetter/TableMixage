function [] = LoadFile( filename )
%LOADFILE Summary of this function goes here
%   Detailed explanation goes here
myFile=load(filename);
y=length(myFile.mozart);
%Y = fft(myFile.mozart,y);
%genereEch(myFile.mozart,y,myFile.fe,5000);
N_v = 0:y-1;
Nfft = 256;
%X=fft(myFile.mozart,Nfft);

figure, 
subplot 211
%représentation temporelle
plot(N_v,myFile.mozart);
xlim([0 5000-1]); %limite valeurs de x
xlabel('Numéro échantillon');
ylabel('s(t)');

subplot 212
var=256;
spectrogram(myFile.mozart,rectwin(var),var/2,Nfft,myFile.fe,'yaxis');
%soundsc(myFile.mozart);
end

