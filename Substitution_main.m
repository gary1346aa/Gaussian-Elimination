size = 10000;
A = rand(size,size);
L = tril(A);
U = triu(A);
b(1:size,1) = (-1).^(0:size-1);


tic 
xbs = BS(U,b);
toc
t1 = toc;

tic
xbsr = BSR(U,b);
toc
t2 = toc;

tic
xfs = FS(L,b);
toc
t3 = toc;

tic
xfsr = FSR(L,b);
toc
t4 = toc;