%Ejemplo Estimador de mínimos cuadrados
A=4; % valor DC de la señal xn "desconocido"
iterv=[];
A_hv=[];
errorv=[];

for i=100:100:100000
    
    N=i; % número de muestras de xn
    xn=A+normrnd(0,1,N,1); % señal con ruido (media=0, sigma=1)
    %Optimización por gradiente descendente
    % punto de partida
    A_h=xn(1);
    %parametros de optimizacion
    stop = 1;
    step=0.1;
    max_iter=500;
    iter=0;
    % loop de optimización
    while stop > 0.00001 & iter<max_iter
        A_hp=A_h;
        err=-sum((xn-A_h))/N;
        A_h=A_h-step*err;
        stop = abs(A_h-A_hp);
        iter = iter+1;
    end
    iter;
    A_h;
    error = abs(A-A_h);
    %Resultado final
    iterv=[iterv iter];
    A_hv=[A_hv A_h];
    errorv=[errorv  error];    
end

i=[100:100:100000];
subplot(3,1,1)
plot(i,iterv)
title('iteraciones')
subplot(3,1,2)
plot(i,A_hv)
title('A Aprox')
subplot(3,1,3)
plot(i,errorv)
title('error Aprox')