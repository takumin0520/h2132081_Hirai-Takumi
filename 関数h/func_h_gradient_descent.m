%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%最急降下%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%学習準備%%%%%%%%%%%%%%%%%%
X = 1*[1;1]; %変数初期値
Max = 10000; %イタレーション上限
h_=zeros(Max,1); %間数値保存用
tau = 1e-4;%学習率更新刻み幅
grad_h = [1;1];

%%%%%学習%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:Max
 x = X(1); y = X(2); 
alp = 0;  %ステップサイズ初期化
%alp = 1e-5; %固定ステップサイズ
zai = 0.5; % アルミホ定数

h = hmake(X); %間数値
h_(i) = h;
grad_h = [2*x - 20*y^2;
        -40*x*y + 400*y^3]; %勾配

X_up = X-alp*grad_h; %初期更新

%%%%%ステップサイズ調整%%%%%%%%%%%%%%%%%
while hmake(X_up) >= h + zai*alp*(grad_h'*grad_h)
alp = alp + tau;
X_up = X- alp*grad_h; %更新
end

X = X- alp*grad_h;
end


%%%%%%%%結果%%%%%%%%%%%%%%%%
figure(1)
plot([1:Max],h_,'LineWidth',1.5);hold on;
xlabel('ieration number');ylabel('cost');
hold off;
