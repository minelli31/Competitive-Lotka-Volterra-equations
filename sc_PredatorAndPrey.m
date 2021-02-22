% sc_PredatorAndPrey.m
% Script para evaluar la de Volterra‐Lotka
clear all
clc   
Tini = 1;  % Inicio de las iteraciones
T = 100;    % Tiempo de simulación
a = 1;
b = 1;
c = 1;
d = 1;
x0 = [.3, .7]; %Presas y depredadores respectivamente.
% Ecuación 4.33 utilizando ODE45 
deq1=@(t,x) [x(1)*(a - b*x(2)); x(2)*(-c+d*x(1))];
[t,sol] = ode45(deq1,[0 T],x0);

tamanioM = size(t);  % Tamaño de la matriz de tiempo para el bucle for.
% Las soluciones se pintan en cada paso de tiempo
for i = 1 : max(tamanioM) 
    figure(1),subplot(1,1,1)
    plot(sol(Tini,1),sol(Tini,2),'.b','color',[rand; rand; rand],'markersize',12,'MarkerFaceColor','b');                               
    hold on
    title(['Depredadores vs presas       t = ' num2str(t(Tini))],'fontsize',12)
    xlabel('presas','fontsize',12)
    ylabel('depredadores','fontsize',12)
    axis([min(sol(:,1)) max(sol(:,1)) min(sol(:,2)) max(sol(:,2))])
    Tini = Tini + 1;   % Adds 1 to the iteration count. 

end
% Gráficas de población vs tiempo
    figure(2),subplot(1,1,1)
    plot(t(:,1),sol(:,1),'b-','markersize',10,'MarkerFaceColor','b')
    title(['Teoría de juegos y ecología        Tiempo = ' num2str(max(t)) ' seconds '],'fontsize',12)
    xlabel('tiempo')
    ylabel('poblaciones')
    axis([min(t(:,1)) max(t(:,1)) min(sol(:,1)) max(sol(:,1))])
    hold on
    figure(2)
    plot(t(:,1),sol(:,2),'r-','markersize',10,'MarkerFaceColor','g')
    axis([min(t(:,1)) max(t(:,1)) min(sol(:,2)) max(sol(:,2))])
    hold off
    legend('Presas','Depredadores')
