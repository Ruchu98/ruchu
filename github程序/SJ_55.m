clc
clear
close all
A=xlsread('C:\Users\DELL\Desktop\王羽第三篇\调查问卷数据\55以上.xlsx','H2:DQK37');
m=size(A,2)./7;
for i=1:size(A,1)
    for j=1:m
        s= (j - 1) *7 + 1;
        e=j*7;
        B{i,j}=A(i,s:e);
    end
end
m1=size(B,2)./9;
for i=1:size(A,1)
    E{i,:}=reshape(B(i,:),9,50)';%%%%%%%%%DM的评价值原始矩阵
end
%% 找缺失方案
for i=1:size(A,1)
    F{i,:}=sum(cell2mat(E{i}),2)';
end
zeroCountPerColumn = sum(cell2mat(F) == 0);
a3=find(zeroCountPerColumn>=18);%%缺失方案

%% 判断属性是否缺失
for k=1:size(E,1)
    for i=1:size(E{1},1)
        for j=1:size(E{1},2)
            G{k,:}(i,j)=sum(cell2mat(E{k}(i,j)));%%%%%%%%%如果各个DM相同属性位置都没有评价，认为缺失
        end
    end
end
zeroCount = sum(cat(3, G{:}) == 0, 3);%%%每个评价值位置的数字是没有作答的DM的数量
S=sum(zeroCount,1)./(36*50);%%每个属性没有考虑的DM的数量
MS=max(S);IS=min(S);JJ=MS-(MS-IS)./3;
s3=find( (S >= JJ & S <= MS));%%%缺失的属性

%% 转PLTS矩阵
% 初始化一个与元胞数组相同大小的空元胞数组
R = cell(size(E{1},1),size(E{1},2));
for i=1:size(E{1},1)
    for j=1:size(E{1},2)
        % 初始化当前位置的结果行向量
        sumVector = zeros(size(E{1}{i, j}));
        % 对相同位置的行向量进行相加
        for k=1:size(E,1)
            cuu = E{k}{i, j};
            sumVector = sumVector + cuu;
        end
        % 将相加结果存储到结果元胞数组中
        R{i, j} = sumVector;
    end
end

% 创建一个与元胞数组相同大小的空的元胞数组
GL = cell(size(R, 1),  size(R, 2));
% 对元胞数组中每个位置的行向量进行操作
for i = 1:size(R, 1)
    for j = 1: size(R, 2)
        % 获取当前位置的行向量
        cv = R{i, j};
        % 计算行向量的和
        vectorSum = sum(cv);
        % 将行向量除以行向量的和
        normalizedVector = cv / vectorSum;
        % 将归一化后的行向量存储到结果元胞数组中的相同位置
        GL{i, j} = normalizedVector;%%%概率出来了
    end
end


% 创建一个包含行向量[0, 1, 2, 3, 4, 5, 6]的模板数组
templateVector = [0, 0.33, 0.5, 0.5, 0.5, 0.67, 1];

% 创建一个空的元胞数组
XB = cell(size(R, 1),  size(R, 2));

% 填充元胞数组的每个位置
for i = 1:size(R, 1)
    for j = 1:size(R, 2)
        XB{i, j} = templateVector;
    end
end
%% 将概率和下标合并
% 获取元胞数组的大小
[numRows, numCols] = size(XB);

% 创建一个空的元胞数组来存储交叉合并的结果
crossMergedArray = cell(numRows, numCols);

% 交叉合并两个元胞数组
for i = 1:numRows
    for j = 1:numCols
        % 从第一个元胞数组获取当前位置的行向量
        vector1 =XB{i, j};
        % 从第二个元胞数组获取当前位置的行向量
        vector2 = GL{i, j};
        % 交替合并两个行向量
        crossMergedVector = [];
        for k = 1:length(vector1)
            crossMergedVector = [crossMergedVector; vector1(k), vector2(k)];
        end
        % 将交叉合并后的行向量存储在结果元胞数组的当前位置
        crossMergedArray{i, j} = crossMergedVector;%%%%PLTS初步，要去掉概率为0的
    end
end
PPP3=crossMergedArray;%%%没有去掉概率为0的PLTS

% 创建一个空的元胞数组
PLTS = cell(numRows, numCols);

% 填充元胞数组的每个位置
for i = 1:numRows
  for j = 1:numCols
    
    % 检查矩阵的第二列是否有0
    if any(crossMergedArray{i,j}(:, 2) == 0)
      % 如果第二列有0，则去掉具有0的那一行
      crossMergedArray{i,j}(crossMergedArray{i,j}(:, 2) == 0, :) = [];
    end
    % 将矩阵存储在元胞数组的当前位置
    PLTS{i, j} = crossMergedArray{i,j};
  end
end
PPP3=PLTS;
%% 去除方案和属性
PLTS(a3, :) = [];  % 去除指定的行
PLTS(:, s3) = [];  % 去除指定的列
DM3=PLTS;
GL(a3, :) = [];  % 去除指定的行
GL(:, s3) = [];  % 去除指定的列
PPP3(a3, :) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};  
PPP3(:, s3) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};  


save('DM3','DM3')
save('PM3','PPP3')
save('FA3','a3')
save('SX3','s3')


% %   w1=[0.222222222222222,0.333333333333333,0.111111111111111,0.333333333333333];

%% 计算个体语义

% % % 循环遍历每个元胞数组和行向量的元素，进行乘法操作
% % for i = 1:45
% %     for j = 1:4
% %         GL{i, j} = GL{i, j} *w1(j);
% %     end
% % end
% % 
% % sumArray = zeros(1, 7); % 初始化一个与行向量大小相同的零向量
% % 
% % for i = 1:45
% %     for j = 1:4
% %         % 将当前位置的行向量与对应的位置相加
% %         sumArray = sumArray + GL{i, j};
% %     end
% % end


% % o=[2 3 5 6];
% % mubiao= sumArray(o);
% % f=-[0.584490691479300,5.29574187717636,9.11932887770916,10.1791497094616];
% % A=[ 1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
% % b=[2/6;3/6;5/6;1];
% % Aeq=[1 0 0 1; 0 1 1 0];
% % beq=[1;1];
% % vlb=[0,1/6,3/6,4/6];
% % vub=[];    
% % [x,fval]=linprog(f,A,b,Aeq,beq,vlb,vub)

