x = inline ('mod(t+pi/2,2*pi)< =pi');
t = linspace (-2*pi, 2*pi,1000);
sumterms = zeros(16, length(t)); 
sumterms(1,:) = 1/2;
for n = 1:size(sumterms,1)-1;
sumterms(n+1,:) = (2/(pi*n)*sin(pi*n/2))*cos(n*t);
end
x_N = cumsum (sumterms); figure(1); clf; ind = 0;
for N = [0,1:2:size(sumterms, 1)-1],
ind = ind+1; subplot (3,3,ind);
plot (t,x_N(N+1),:), 'k';t;x(t), 'k--');
axis ([-2*pi 2*pi -0.2 1.2]);
xlabel ('t'); ylabel (['x_{',num2str (N),'} (t)']);
end
%subplot(3,1,3);
%x = linspace(0,10);
%y1 = sin(x);
%plot(x,y1)

%subplot(3,1,2); 
%y2 = sin(5*x);
%plot(x,y2)

%subplot(3,1,1);
%x = linspace(0,10);
%y3 = sin(8*x);
%plot(x,y3)