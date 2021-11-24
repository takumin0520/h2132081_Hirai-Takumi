%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%最急降下%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%学習準備%%%%%%%%%%%%%%%%%%
X = 100*eye(2,1); %変数初期値
Max = 1000; %イタレーション上限
f_=zeros(Max,1); %間数値保存用
tau = 1e-2;%学習率更新刻み幅


%%%%%学習%%%%%%%%%%%%%%%%%%%%%%%

for i = 1: Max
alp = 0;  %ステップサイズ初期化
%alp = 0.5; %ステップサイズ固定
zai = 0.5; % アルミホ定数

f = fmake(X); %間数値
f_(i) = f;
grad_f  = [2*X(1)+ X(2)-1;
            X(1)+ 2*X(2)];  %勾配

X_up = X-alp*grad_f; %初期更新

while fmake(X_up) >= f + zai*alp*grad_f'*grad_f
alp = alp + tau;
X_up = X- alp*grad_f; %更新
end

X = X- alp*grad_f;
end


%%%%%%%%結果%%%%%%%%%%%%%%%%
figure(1)
plot([1:Max],f_,'LineWidth',1.5);hold on;
xlabel('ieration number');ylabel('cost');
hold off;
