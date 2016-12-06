function [x] = genereEch (x,N,fe,N_rep)
N_v = 0:N-1;
Nfft = 4096;
X=fft(x,Nfft);

%représentation
axe_f=-fe/2:fe/Nfft:fe/2-fe/Nfft;

figure, 
subplot 211
%représentation temporelle
plot(N_v,x);
xlim([0 N_rep-1]); %limite valeurs de x
xlabel('Numéro échantillon');
ylabel('s(t)');

subplot 212
%représentation en fréquence
plot(axe_f,fftshift(abs(X)));
title('f(Hz)');

end