I = imread('G:\Academics\6 semester\Soft Computing\4.gif');
BW1 = im2bw(I,0.05);

global BWA;
BWA = imcomplement(BW1);

dim = size(BWA);
col = round(dim(2)/2)-90;
row = min(find(BWA(:,col)));
boundary = bwtraceboundary(BWA,[row, col],'N');

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

global xb4 yb4;
xb4 = int16(xa(ind));
yb4 = int16(ya(ind));

BWB = BWA;

popx = 1:512;
popx(int16(xb4)) = [];

popy = 1:512;
popy(int16(yb4)) = [];

global xnn4 ynn4;
%xnn = randi([1 512],1,100);
xnn4 = popx(randi(numel(popx), 1, 100));
%ynn = randi([1 512],1,100);
ynn4 = popx(randi(numel(popy), 1, 100));

g=sprintf('%d ', xb4);
fprintf('XRiv1 %s\n', g);

h=sprintf('%d ', yb4);
fprintf('YRiv1 %s\n', h);

g=sprintf('%d ', xnn4);
fprintf('XNRiv1 %s\n', g);

h=sprintf('%d ', ynn4);
fprintf('YNRiv1 %s\n', h);
    
xtot = randi(1000,1,512);
ytot = randi(1000,1,512);

figure1=figure('Position', [0, 0,1500,600]);


subplot(1,3,1), subimage(BWA);
subplot(1,3,2), subimage(BWB);
subplot(1,3,3), subimage(BWC);