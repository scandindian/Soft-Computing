I = imread('G:\Academics\6 semester\Soft Computing\3.gif');
BW = im2bw(I,0.0549);

dim = size(BW);
col = round(dim(2)/2)-90;
row = min(find(BW(:,col)));
boundary = bwtraceboundary(BW,[row, col],'N');

global BWB;

minx = min(boundary(:,2));
miny = min(boundary(:,1));

maxx = max(boundary(:,2));
maxy = max(boundary(:,1));

nx=50;
ny=50;

xp=linspace(minx,maxx,nx);
yp=linspace(miny,maxy,ny);
[xd,yd]=meshgrid(xp,yp);

ip=inpolygon(xd,yd,boundary(:,2),boundary(:,1));

xa = xd(ip);
ya = yd(ip);

ind =  randi([1 400],1,50);

global xb3 yb3;
xb3 = int16(xa(ind));
yb3 = int16(ya(ind));

popx = 1:512;
popx(int16(xb3)) = [];

popy = 1:512;
popy(int16(yb3)) = [];

global xnn3 ynn3;
%xnn = randi([1 512],1,100);
xnn3 = popx(randi(numel(popx), 1, 100));
%ynn = randi([1 512],1,100);
ynn3 = popx(randi(numel(popy), 1, 100));

g=sprintf('%d ', xb3);
fprintf('XRiv2 %s\n', g);

h=sprintf('%d ', yb3);
fprintf('YRiv2 %s\n', h);

g=sprintf('%d ', xnn3);
fprintf('XNRiv2 %s\n', g);

h=sprintf('%d ', ynn3);
fprintf('YNRiv2 %s\n', h);
    
