function [ signalBruite ] = bruiteSignal( typeBruit, signal, db )

Ps = signal' * signal;
Pb = bruit' * bruit ;
sigma = sqrt((Ps/Pb)
b = sigma * bruit;
RSB = Ps/Pb;

    if typeBruit STRCMP 'Blanc'
        bruit = sigma*randn(1,length(signal));
    
    elseif typeBruit STRCMP 'Tonal'
        f0 = 880;
        bruit = sin(2*pi*f0*t);
        
    end       
end

