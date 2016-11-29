function [ note ] = genereEchPeriod(note, N,fe,f0,nbh )
N_v = 0:N-1;
amp_h = [1,0.7,0.95,0.75,0.6,0.65,0.65,0.5,...
    0.6,0.5,0.45,0.5,0.6,0.5,0.25,0.5,0.3,0.25,0.3,0.4,0.3,0.25,0.2,0.15];

for i =1:nbh
    note = note +amp_h(i)*sin(2*pi*(i+1)*f0/fe*N_v);

end

