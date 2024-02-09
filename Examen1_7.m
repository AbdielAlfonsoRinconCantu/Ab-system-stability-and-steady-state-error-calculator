% Examen del primer parcial, ver 1.7
% Abdiel Alfonso Rincon Cantu, 738884
% Control aplicado, Dr. Jorge Quishpe Armas

clear %elimina variables
contador=0; % declara contador
syms s; %declara s
[contador]=procesar([4 -8],[1 3 18 0],0:0.01:20,contador,s,(4*s-8)/(s^3+3*s^2+18*s)); % sistema 1
[contador]=procesar([4 -8],[1 3 18],0:0.01:4,contador,s,(4*s-8)/(s^2+3*s+18)); % sistema 2
[contador]=procesar(18,[1 20 -50 0],0:0.01:3,contador,s,(18)/(s^3+20*s^2-50*s)); % sistema 3

function [contador]=procesar(numerador,denominador,t,contador,s,funcion) % declara función
    contador=contador+1; % cuenta
    fprintf('\n%d.\n',contador); % imprime separador
    E_s=tf(numerador,denominador) % E(s)
    E_c=feedback(E_s,1) % Ec(s)
    pole(E_c) % polos de Ec(s)
    figure; % crea nueva ventana para figura
    pzplot(E_c); % grafica los polos de Ec(s)
    title(sprintf('%d. Polos de $E_c$',contador),'Interpreter','LaTeX'); % título de gráfica
    figure; % crea nueva ventana para figura
    step(E_c); % grafica la respuesta de Ec(s) al introducir un escalón
    title(sprintf('%d. Respuesta de $E_c$ a escalon',contador),'Interpreter','LaTeX'); % título de gráfica
    estabilidad=isstable(E_c); % revisa si E_c es estable
    if estabilidad==1 % si es estable
        disp('El sistema es estable.'); % imprime mensaje
    else % si no
        disp('El sistema no es estable.'); % imprime mensaje
    end % fin del condicional
    fprintf('\nError en estado estacionario para señales:\n'); % imprime
    Escalon=1/(1+(limit(funcion, s, 0))); % error en estado estacionario escalón
    Rampa=1/(limit(s*funcion, s, 0)); % error en estado estacionario rampa
    Parabola=1/(limit(s^2*funcion, s, 0)); % error en estado estacionario parábola
    if isnan(Escalon) % si escalón es NaN
        fprintf('  Escalón: 0\n') % imprime error escalón = 0
    else % si no
        fprintf('  Escalón: %f\n',Escalon); % imprime error escalón != 0
    end % fin del condicional
    fprintf('  Rampa: %f\n', Rampa); % imprime error rampa
    fprintf('  Parábola: %f\n', Parabola); % imprime error parábola
    figure; % crea nueva ventana para figura
    lsim(E_c,t,t); % simula y grafica respuesta de E_c a rampa
    title(sprintf('%d. Respuesta de $E_c$ a rampa',contador),'Interpreter','LaTeX'); % título de gráfica 
    figure; % crea nueva ventana para figura
    lsim(E_c, 0.5*(t).^2,t); % simula y grafica respuesta de E_c a parábola
    title(sprintf('%d. Respuesta de $E_c$ a parabola',contador),'Interpreter','LaTeX'); % título de gráfica
end % fin de la función