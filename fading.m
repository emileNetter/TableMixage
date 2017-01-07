function [ sortie ] = fading( signal,type,duree,fe )
sortie=signal;
Nech=floor(duree*fe);
tmp1 = 'in';
tmp2 = 'out';
tf1 = strcmp(tmp1,type);
tf2 = strcmp(tmp2,type);
%Construction d'un vecteur intensite en croissance linéaire
vectIntensite=zeros(Nech,1);

 for k=1:length(vectIntensite)
     vectIntensite(k)=k/length(vectIntensite);
 end
 
if tf1   
    for i=1:Nech
        sortie(i)=sortie(i)*vectIntensite(i);
    end 
    
elseif tf2
    for i=1:Nech
        sortie(length(signal)-i)=sortie(length(signal)-i)*vectIntensite(i);
    end 
end

end

