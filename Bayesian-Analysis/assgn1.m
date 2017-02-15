I = imread('G:\Academics\6 semester\Soft Computing\1.gif');
BW = im2bw(I,0.042);

global BWD;

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

BWD = BWA;
xa = xd(ip);
ya = yd(ip);

ind =  randi([1 400],1,50);

global xb1 yb1;
xb1 = int16(xa(ind));
yb1 = int16(ya(ind));

popx = 1:512;
popx(int16(xb1)) = [];

popy = 1:512;
popy(int16(yb1)) = [];

global xnn1 ynn1;
%xnn = randi([1 512],1,100);
xnn1 = popx(randi(numel(popx), 1, 100));
%ynn = randi([1 512],1,100);
ynn1 = popx(randi(numel(popy), 1, 100));

g=sprintf('%d ', xb1);
fprintf('XRiv1 %s\n', g);

h=sprintf('%d ', yb1);
fprintf('YRiv1 %s\n', h);

g=sprintf('%d ', xnn1);
fprintf('XNRiv1 %s\n', g);

h=sprintf('%d ', ynn1);
fprintf('YNRiv1 %s\n', h);


    
