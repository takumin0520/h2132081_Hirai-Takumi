clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%最急降下%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%学習準備%%%%%%%%%%%%%%%%%%
X = 100*[1;1;1]; %変数初期値
Max = 100; %イタレーション上限
g_=zeros(Max,1); %間数値保存用
tau = 1e-2;%学習率更新刻み幅
g = 1;
grad_g = [1;1;1];
g_old = 0;
i = 0;
%%%%%学習%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:Max;
 x = X(1); y = X(2); z = X(3);
alp = 0;  %ステップサイズ初期化
%alp = 1e-5; %固定ステップサイズ
zai = 0.5; % アルミホ定数
g_old  = g;
g = gmake(X);%間数値
g_(i) = g;

g1 =4*x^3 - 6*x^2*y + 4*x*z^3 - y*z;
g2 =  -2*x^3 - x*z + 4*y*z^2;
g3 = 6*x^2*z^2  -x*y +  4*y^2*z + 6*z^5;

grad_g = [g1;g2;g3];
X_up = X-alp*grad_g; %初期更新

%%%%%ステップサイズ調整%%%%%%%%%%%%%%%%%
while gmake(X_up) >= g + zai*alp*(grad_g'*grad_g)
alp = alp + tau;
X_up = X- alp*grad_g; %更新
if alp >= 1; error('学習率が見つかりません');end;
end

X = X- alp*grad_g;
end


%%%%%%%%結果%%%%%%%%%%%%%%%%
figure(1)
plot([1:i],g_,'LineWidth',1.5);hold on;
xlabel('ieration number');ylabel('cost');
hold off;
