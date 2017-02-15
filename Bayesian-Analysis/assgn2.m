I = imread('G:\Academics\6 semester\Soft Computing\2.gif');
BW = im2bw(I,0.042);


dim = size(BW);
col = round(dim(2)/2)-90;
row = min(find(BW(:,col)));
boundary = bwtraceboundary(BW,[row, col],'N');


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

global xb2 yb2;
xb2 = int16(xa(ind));
yb2 = int16(ya(ind));

global BWC;

popx = 1:512;
popx(int16(xb2)) = [];

popy = 1:512;
popy(int16(yb2)) = [];

BWC = BWA;
global xnn2 ynn2;
%xnn = randi([1 512],1,100);
xnn2 = popx(randi(numel(popx), 1, 100));
%ynn = randi([1 512],1,100);
ynn2 = popx(randi(numel(popy), 1, 100));

g=sprintf('%d ', xb2);
fprintf('XRiv2 %s\n', g);

h=sprintf('%d ', yb2);
fprintf('YRiv2 %s\n', h);

g=sprintf('%d ', xnn2);
fprintf('XNRiv2 %s\n', g);

h=sprintf('%d ', ynn2);
fprintf('YNRiv2 %s\n', h);
    
