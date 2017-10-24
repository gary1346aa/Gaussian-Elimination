%% Random U/L Matrix Generation 
size = 10000;
A = rand(size,size);
L = tril(A);
U = triu(A);
b(1:size,1) = (-1).^(0:size-1);
%%

%% Substitution Simulation
tic 
xbs = BS(U,b); %Backward Substitution in Column order
toc
t1 = toc;

tic
xbsr = BSR(U,b); %Backward Substitution in Row order
toc
t2 = toc;

tic
xfs = FS(L,b); %Forward Substitution in Column order
toc
t3 = toc;

tic
xfsr = FSR(L,b); %Forward Substitution in Row order
toc
t4 = toc;
%%

Performance = [t1,t2,t3,t4];