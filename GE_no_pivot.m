format long
% size = 100;
% A = rand(size,size);
% answer(1:size,1) = (-1).^(0:size-1);
% y = A*answer;
A = [1 0 0 0 1; -1 1 0 0 1;-1 -1 1 0 1; -1 -1 -1 1 1;-1 -1 -1 -1 1];
answer = [1/7 ;-2/7 ;3/7; -4/7; 5/7];
y = A*answer;

tic
for i = 1:5
    [U1,x1] = GE(A,y);
end
toc
tic
for i = 1:5
[U2,x2] = GEPP(A,y);
end
toc
tic
for i = 1:5
[U3,x3] = GECP(A,y);
end
toc
tic
for i = 1:5
[U4,x4] = GERP(A,y);
end
toc

compare = [answer x1 x2 x3 x4];

y1 = A*x1;
y2 = A*x2;
y3 = A*x3;
y4 = A*x4;

Residual = [y-y1,y-y2,y-y3,y-y4;std(y-y1),std(y-y2),std(y-y3),std(y-y4)];