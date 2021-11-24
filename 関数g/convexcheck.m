X = rand(3,1);
Y  = rand(3,1);

tau = 1e-2;

lam = 0;

f1 = 100; f2 = 200;

while f1 <= f2
    f1 = gmake((1-lam)*X + lam*Y);
    f2 = (1-lam)*gmake(X) + lam*gmake(Y);
    lam = lam + tau;
    if lam >=1; error('gは凸関数');end;
end

    

