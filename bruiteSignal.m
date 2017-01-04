function [ signalBruite ] = bruiteSignal( typeBruit, signal,fe, RSBdb )

    if typeBruit == 'Blanc'
        bruit = randn(1,length(signal));
    
    elseif typeBruit == 'Tonal'
        vectN=1:length(signal);
        f0 = 880;
        bruit = sin(2*pi*f0*vectN/fe);
        
    end     
    
    Ps = signal' * signal;
    Pb = bruit * bruit' ;
    RSB = Ps/Pb;
    sigma = sqrt(RSB*10^(-RSBdb/10));      
    signalBruite = signal'+sigma*bruit;
end

