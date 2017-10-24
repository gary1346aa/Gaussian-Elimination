format long
size = 100;
A = rand(size,size);
answer(1:size,1) = (-1).^(0:size-1);
y = A*answer;
% A = [1 0 0 0 1; -1 1 0 0 1;-1 -1 1 0 1; -1 -1 -1 1 1;-1 -1 -1 -1 1];
% answer = [1/7 ;-2/7 ;3/7; -4/7; 5/7];
% y = A*answer;

tic
[U1,x1] = GE(A,y);
toc
t1 = toc;

tic
[U2,x2] = GEPP(A,y);
toc
t2 = toc;

tic
[U3,x3] = GECP(A,y);
toc
t3 = toc;

tic
[U4,x4] = GERP(A,y);
toc
t4 = toc;

compare = [answer x1 x2 x3 x4];

y1 = A*x1;
y2 = A*x2;
y3 = A*x3;
y4 = A*x4;

Performance = [t1,t2,t3,t4];
Residual = [y-y1,y-y2,y-y3,y-y4];
Standard_Deviation = [std(y-y1),std(y-y2),std(y-y3),std(y-y4)];