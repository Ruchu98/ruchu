function [TEA,GWI,G_A,GGAA,GCI,woo,WWI,CCI,WWCCI,GAAP,GAA123]=gongshi(DDD,QQ);
PPP1=QQ{1};PPP2=QQ{2};PPP3=QQ{3};
load('FA1','a1')
load('SX1','s1')
load('FA2','a2')
load('SX2','s2')
load('FA3','a3')
load('SX3','s3')
aaa={a1,a2,a3};sss={s1,s2,s3};
%% 基数共识
for i=1:size(DDD,1)
    for j=1:size(DDD,2)
        F1(i,j)=1-WY_3juli(DDD{i,j},PPP1{i,j});
    end
end
F1(a1,:)=0;
F1(:,s1)=0;
FI1=sum(F1,2)./(size(F1,2)-length(s1));%% DM1方案层面
WI1=sum(FI1)./(size(F1,1)-length(a1));

for i=1:size(DDD,1)
    for j=1:size(DDD,2)
        F2(i,j)=1-WY_3juli(DDD{i,j},PPP2{i,j});
    end
end
F2(a2,:)=0;
F2(:,s2)=0;
FI2=sum(F2,2)./(size(F2,2)-length(s2));%% DM2方案层面
WI2=sum(FI2)./(size(F2,1)-length(a2));

for i=1:size(DDD,1)
    for j=1:size(DDD,2)
        F3(i,j)=1-WY_3juli(DDD{i,j},PPP3{i,j});
    end
end
F3(a3,:)=0;
F3(:,s3)=0;
FI3=sum(F3,2)./(size(F3,2)-length(s3));%% DM3方案层面
TEA=[FI1,FI2,FI3];

WI3=sum(FI3)./(size(F3,1)-length(a3));
GWI=[WI1,WI2,WI3];%%个体共识水平


%% 序数共识水平
for i=1:size(DDD,1)
    for j=1:size(DDD,2)
        G(i,j)=WY_3defenhanshu(DDD{i,j});
    end
end
GG=sum(G,2);
for i=1:size(GG)
    GG(i,2)=i;
end
Paixu=sortrows(GG,-1);%%Paixu第二列是群体的方案的排序
for i=1:size(GG)
    Paixu(i,3)=i;
end
Weizhixu=sortrows(Paixu,2);%%%Weizhixu第三列是群体的位置序
GAA123=Weizhixu(:,3);GAAP=Paixu(:,2);

for i=1:size(PPP1,1)
    for j=1:size(PPP1,2)
        G1(i,j)=WY_3defenhanshu(PPP1{i,j});
    end
end
GG1=sum(G1,2);
for i=1:size(GG1)
    GG1(i,2)=i;
end
Paixu1=sortrows(GG1,-1);%%%DM1
for i=1:size(GG1)
    Paixu1(i,3)=i;
end
Weizhixu1=sortrows(Paixu1,2);%%%DM1
GAA111=Weizhixu1(:,3);

for i=1:size(PPP2,1)
    for j=1:size(PPP2,2)
        G2(i,j)=WY_3defenhanshu(PPP2{i,j});
    end
end
GG2=sum(G2,2);
% % % GAA2=GG2;
for i=1:size(GG2)
    GG2(i,2)=i;
end
Paixu2=sortrows(GG2,-1);%%%DM2
for i=1:size(GG2)
    Paixu2(i,3)=i;
end
Weizhixu2=sortrows(Paixu2,2);%%%DM2
GAA222=Weizhixu2(:,3);

for i=1:size(PPP3,1)
    for j=1:size(PPP3,2)
        G3(i,j)=WY_3defenhanshu(PPP3{i,j});
    end
end
GG3=sum(G3,2);
for i=1:size(GG3)
    GG3(i,2)=i;
end
Paixu3=sortrows(GG3,-1);%%%DM3
for i=1:size(GG3)
    Paixu3(i,3)=i;
end
Weizhixu3=sortrows(Paixu3,2);%%%DM3
GAA333=Weizhixu3(:,3);
GAA1=GAA123-GAA111;GAA2=GAA123-GAA222;GAA3=GAA123-GAA333;
PX=[Paixu1,Paixu2,Paixu3];
G_A=[GAA1,GAA2,GAA3];
GGAA=[abs(GAA1),abs(GAA2),abs(GAA3)];

% 找出第一列为0的行索引
zero_indices1 = find(Paixu1(:, 1) == 0);
% 提取第二列中与0对应的值
values_to_permute1 = Paixu1(zero_indices1, 2);
% 计算这些值的所有可能排列组合
all_permutations1 = perms(values_to_permute1);
% 初始化一个存储新矩阵的单元数组
new_matrices1 = cell(size(all_permutations1, 1), 1);
% 根据所有可能的排列组合生成新矩阵
for i = 1:size(all_permutations1, 1)
    new_matrix1 = Paixu1;
    new_matrix1(zero_indices1, 2) = all_permutations1(i, :);
    new_matrices1{i} = new_matrix1;
end


% 找出第一列为0的行索引
zero_indices2 = find(Paixu2(:, 1) == 0);
% 提取第二列中与0对应的值
values_to_permute2 = Paixu2(zero_indices2, 2);
% 计算这些值的所有可能排列组合
all_permutations2 = perms(values_to_permute2);
% 初始化一个存储新矩阵的单元数组
new_matrices2 = cell(size(all_permutations2, 1), 1);
% 根据所有可能的排列组合生成新矩阵
for i = 1:size(all_permutations2, 1)
    new_matrix2 = Paixu2;
    new_matrix2(zero_indices2, 2) = all_permutations2(i, :);
    new_matrices2{i} = new_matrix2;
end


% 找出第一列为0的行索引
zero_indices3 = find(Paixu3(:, 1) == 0);
% 提取第二列中与0对应的值
values_to_permute3 = Paixu3(zero_indices3, 2);
% 计算这些值的所有可能排列组合
all_permutations3 = perms(values_to_permute3);
% 初始化一个存储新矩阵的单元数组
new_matrices3 = cell(size(all_permutations3, 1), 1);
% 根据所有可能的排列组合生成新矩阵
for i = 1:size(all_permutations3, 1)
    new_matrix3 = Paixu3;
    new_matrix3(zero_indices3, 2) = all_permutations3(i, :);
    new_matrices3{i} = new_matrix3;
end

for k=1:size(new_matrices1,1)
      CD1(k)= wy_3_xgs(new_matrices1{k}(:,2),Paixu(:,2));
end
GCD1=mean(CD1);%%%DM1序共识度

for k=1:size(new_matrices2,1)
      CD2(k)= wy_3_xgs(new_matrices2{k}(:,2),Paixu(:,2));
end
GCD2=mean(CD2);%%%DM2序共识度

for k=1:size(new_matrices3,1)
     CD3(k)= wy_3_xgs(new_matrices3{k}(:,2),Paixu(:,2));
end
GCD3=mean(CD3);%%%DM3序共识度
GCI=[GCD1,GCD2,GCD3];
%% 求专家权重
for i=1:length(GCI)
    wo(i)=(GWI(i)+GCI(i))./2;
end
woo=wo./(sum(wo));%%专家权重

%% 两个共识度
WWI=sum(woo.*GWI);%基数共识
CCI=sum(woo.*GCI);%序数共识
WWCCI=(WWI+CCI)./2;
end