function PPP1=F1
numRows = 50;
numCols = 9;
% 随机生成3x4的元胞数组
cellArray = cell(numRows, numCols);

% 随机生成每个元胞中的向量
for i = 1:numRows
    for j = 1:numCols
        % 生成一个大小为1x6的随机向量
        randomVector = rand(1, 7);
        % 归一化向量，使其之和为1
        normalizedVector = randomVector / sum(randomVector);
        % 将向量存储在元胞中
        cellArray{i, j} = normalizedVector;
    end
end
templateVector = [0, 0.33, 0.5, 0.5, 0.5, 0.67, 1];

% 创建一个空的元胞数组
XB = cell(size(cellArray, 1),  size(cellArray, 2));

% 填充元胞数组的每个位置
for i = 1:size(cellArray, 1)
    for j = 1:size(cellArray, 2)
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
        vector2 = cellArray{i, j};
        % 交替合并两个行向量
        crossMergedVector = [];
        for k = 1:length(vector1)
            crossMergedVector = [crossMergedVector; vector1(k), vector2(k)];
        end
        % 将交叉合并后的行向量存储在结果元胞数组的当前位置
        crossMergedArray{i, j} = crossMergedVector;%%%%PLTS初步，要去掉概率为0的
    end
end
PPP1=crossMergedArray;%%%没有去掉概率为0的PLTS
end
