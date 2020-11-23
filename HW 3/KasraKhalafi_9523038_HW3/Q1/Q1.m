l1=250;l2=150;l3=300;l4=50;
t1=linspace(-180,180,90)*pi/180;
t2=linspace(-90,90,90)*pi/180;
d3=linspace(0,300,90);
t4=linspace(-180,180,90)*pi/180;
[T1,T2,D3]=ndgrid(t1,t2,d3);

xM = round(l1 * cos(T1) + l2 * cos(T1 + T2)); % and use it in x y z as T4
yM = round(l1 * sin(T1) + l2 * sin(T1 + T2));
zM = round(-D3 + l4);
% 
% xM = round((-cos(T1).*cos(T2)).*((D3 + l2 + l3 + l4))); % and use it in x y z as T4
% yM = round((-cos(T2).*sin(T1)).*(D3 + l2 + l3 + l4));
% zM = round((l1 - l4.*sin(T2) - sin(T2).*(D3 + l2 + l3)));
plot3(xM(:),yM(:),zM(:),'.')
