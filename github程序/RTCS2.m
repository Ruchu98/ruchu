vectqr=sym('x',[length(DP),1]);
for j=1:length(DP)
    QQ222{1,DP(j)}=wy_3_jf_syms(QQ2{XGG,DP(j)},DDD{XGG,DP(j)},vectqr(j));%%%%%%%%g��Ƶ���Լ��޸�
end
for j=1:length(DP)
    GXJL1{1,j}=WY_3juli_sym(QQ2{XGG,DP(j)},QQ222{1,DP(j)});%%%%%%%%g��Ƶ���Լ��޸�
end
QQ222={QQ222{2},QQ222{6},QQ222{7}};
for i=1:length(DP)
  R2{:,i}=1- exp( sym(0.3)*GXJL1(i));
end
save('R2','R2');

% ��ʼ���ܺ�
sumExpression2 = 0;
% ����Ԫ�����飬��ӱ��ʽ
for i = 1:numel( GXJL1)
    sumExpression2 = sumExpression2 +  R2{i};%%%%����ǰ�����֮��
end
simplifiedExpression2 = simplify(sumExpression2);
mubiao2= vpa(simplifiedExpression2,3);%%%%����֮���ģ��Ŀ�꺯��
save('mubiao2','mubiao2');

as2 = vpa(R2, 3);
save('symbol_data1.mat', 'as2');


x= zeros(1, length(DP));%%��ʼֵ
A=[];%%���ԵĲ���ʽ���
b=[];%%���ԵĲ���ʽ�ұ�00000
Aeq=[];
beq=[];
vlb= zeros(1, length(DP));
vub= ones(1, length(DP));
[x,fval,exitflag]=fmincon('fun2',x,A,b,Aeq,beq,vlb,vub,'mycon2')



 
   






