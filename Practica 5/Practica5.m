%% practica 5. Series de Fourir en tiempo continuo.
%
% Autor. Alvarado Angeles Francisco Javier.
%
% Grupo: 2MV1.
%% Objetivos.
% 
% *Realizar gr�ficas de series de Fourier exponenciales y trigonom�tricas en tiempo continuo
% *Manipulaci�n de instrucciones en MATLAB
% *Calculo n�merico de los coeficientes de Fourier
%% Introducci�n
% Los Dn se pueden encontrar usando la transformada de Fourier en tiempo discreto, en donde reciclan un cierto intervalo de una 
% se�al peri�dica alrededor de un periodo. Suponiendo que nuestro intervalo de muestreo lo representamos por una $T$, nuestro n�mero
% de muestras en un periodo $T_0$ esta representado por $N_0=T_0/T$, nuestra relaci�n entre nuestros $D_n$ y nuestra funci�n original 
% esta dada por la siguiente ecuaci�n.
% 
% $$D_{n}=\frac{1}{T_0}\int_{T_0}x(t)\exp{-jn\omega_0t} dt $$ 
%
% $$\lim_{T \to 0}\frac{1}{N_0T}\sum_{k=0}^{N_0-1}x(KT)\exp^{-jn\omega_0 t}T$$
%
% $$\lim_{T \to 0}\frac{1}{N_0}\sum_{k=0}^{N0-1}x(KT)exp^{-jn\Omega_0 k}...(a)$$
%
% $$N_0=\frac{T_0}{t}; \Omega_0=\omega_0 T=\frac{2\pi}{N_0}...(b)$$
%
% Donde x(KT) representa la K-esima muestra de x(t). En la practica, es
% imposible hacer a $T \to 0$ en la ecuaci�n (a), lo podemos hacer tan peque�o como querramos pero nunca igual a cero, de echo esa es la
% definici�n del l�mite sino ser�a una evaluaci�n y no un l�mite.  
%
%
%% Desarrollo.
%% Ejemplo 6.1
% 
d0 = 0.504;
dn = @(n) ((0.504)*(1-4*n*j))/(1+16*n.^2);
t0 = 0;
tf = pi;
f = @(t) exp(-t/2);
armo = 4;
a = -7;
b = 7;
an= @(n) 0.504*(2/(1+16*n.^2));
bn= @(n) 0.504*(8*n/1+16*n.^2);
a0= 0.504;
sfc(t0,tf,bn,an,a0,f,armo,a,b)
sfc11(t0,tf,dn,d0,f,15,a,b)

%% Ejemplo 6.2
%
% $$D_n=-\frac{12}{n^2\pi}\sin(\frac{n\pi}{2})$$
%
% $$D_0=0$$
%
d0 = 0;
dn = @(n) -(12/n.^2*pi)*(sin(n.*pi/2));
t0 = -0,5;
tf = 1.5;
f = @(t) (6*t).*(abs(t)<=0.5)+6*(1-t).*(0.5<t & t<1.5);
armo = 4;
a = -30;
b = 30;
%%
sfc21(t0,tf,dn,d0,f,armo,a,b)
sfc22(t0,tf,dn,d0,f,15,a,b)
%% Ejemplo 6.4
%
%
%
%
%
t0 = -pi;
tf = pi;
d0 = 0.5;
dn = @(n) (1/(n.*pi))*sin(n*pi/2);
f = @(t) (1)*(-pi/2<=t & t<=pi/2);
armo = 4;
a = -5*pi;
b= 5*pi;
%%
sfc31(t0,tf,dn,d0,f,armo,a,b)
sfc32(t0,tf,dn,d0,f,15,a,b)
%% Ejemplo 6.5
%
%
%
%
t0=0;
tf=pi;
d0=0.504;
dn= @(n) 0.504/(1+n*j*4);
f=@(t) exp(-t/2);
armo=4;
a=-3*pi;
b=3*pi;
%%
sfc41(t0,tf,dn,d0,f,armo,a,b)
sfc42(t0,tf,dn,d0,f,15,a,b)
%% Ejemplo 6.7
%
%
%
%
t0=-1.5;
tf=1.5;
d0=1/3;
dn=@(n) 1/3;
f=@(t) dirac(t);
armo=4;
a=-7.5;
b=7.5;
%%
sfc51(t0,tf,dn,d0,f,armo,a,b)
%sfc52(t0,tf,dn,d0,f,15,a,b)



