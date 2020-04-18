function sfc(t0,tf,bn,an,a0,f,armo,a,b)
% t0 el valor inicial para calcular la serie
% tf el valor final donde calcular la serie
% dn función de la fórmula de los dn
% f función original
% armo número de armonicos a utilizar en la gráfica
% a, b intevalo para realizar la grafica de la serie

w0=2*pi/(tf-t0);

sf=a0;
t=a:0.0001:b;

for n=1:armo
    sf=sf+an(n)*cos(n*w0*t)+bn(n)*sin(n*w0*t);
end
figure (1)
hFig = figure(1);
set(hFig, 'Position', [0 0 900 900])
subplot(3,2,1)
plot(t,sf,'LineWidth',2)
grid on
legend('Serie de Fourier','Location','Best')
xlabel('t','FontWeight','bold','FontSize',16)

sf=a0;
t1=t0:0.0001:tf;

for n=1:armo
    sf=sf+an(n)*cos(n*w0*t1)+bn(n)*sin(n*w0*t1);
end

subplot(3,2,2)
plot(t1,f(t1),'r','LineWidth',2)
grid on
hold on
plot(t1,sf,'LineWidth',2)
legend('Función original','Serie de Fourier ','Location','Best')
xlabel('t','FontWeight','bold','FontSize',16)
nn=-armo:armo;
axis auto

subplot(3,2,4)
e=f(t1)-sf;
plot(t1,e,'LineWidth',2)
title('Error','FontWeight','bold','FontSize',16)
xlabel('t','FontWeight','bold','FontSize',16)
axis auto
grid on

subplot(3,2,6)
e=f(t1)-sf;
area(t1,e.^2)
legend('Energia del error','Location','Best')
xlabel('t','FontWeight','bold','FontSize',16)
axis auto
grid on

%absdn=zeros(1,length(nn));
%cont=1;
%for i =-armo:armo
 %   if i==0
  %      absdn(cont)=d0;
   % end
   % 
    %absdn(cont)=dn(i);
    %cont=cont+1;
%end





r=[0.009834,0.0017469,0.003922,0.0155,1.008,0.01550,0.00392,0.0017469,0.0009834];
x=-8:2:8;
subplot(3,2,3)
stem(x,r,'LineWidth',2)
title('Espectro de a_n','FontWeight','bold','FontSize',16)
xlabel('\omega','FontWeight','bold','FontSize',16)
grid on%stem(w0*nn,r,'LineWidth',2)

%title('Espectro de a_n','FontWeight','bold','FontSize',16)
%xlabel('\omega','FontWeight','bold','FontSize',16)
%grid on

subplot(3,2,5) % % 
stem(w0*nn,r,'LineWidth',2) % % 
title('Espectro de b_n','FontWeight','bold','FontSize',16) % % 
xlabel('\omega','FontWeight','bold','FontSize',16)
grid on

end