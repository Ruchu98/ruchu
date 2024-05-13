function PPP1=F1
numRows = 50;
numCols = 9;
% �������3x4��Ԫ������
cellArray = cell(numRows, numCols);

% �������ÿ��Ԫ���е�����
for i = 1:numRows
    for j = 1:numCols
        % ����һ����СΪ1x6���������
        randomVector = rand(1, 7);
        % ��һ��������ʹ��֮��Ϊ1
        normalizedVector = randomVector / sum(randomVector);
        % �������洢��Ԫ����
        cellArray{i, j} = normalizedVector;
    end
end
templateVector = [0, 0.33, 0.5, 0.5, 0.5, 0.67, 1];

% ����һ���յ�Ԫ������
XB = cell(size(cellArray, 1),  size(cellArray, 2));

% ���Ԫ�������ÿ��λ��
for i = 1:size(cellArray, 1)
    for j = 1:size(cellArray, 2)
        XB{i, j} = templateVector;
    end
end
%% �����ʺ��±�ϲ�
% ��ȡԪ������Ĵ�С
[numRows, numCols] = size(XB);

% ����һ���յ�Ԫ���������洢����ϲ��Ľ��
crossMergedArray = cell(numRows, numCols);

% ����ϲ�����Ԫ������
for i = 1:numRows
    for j = 1:numCols
        % �ӵ�һ��Ԫ�������ȡ��ǰλ�õ�������
        vector1 =XB{i, j};
        % �ӵڶ���Ԫ�������ȡ��ǰλ�õ�������
        vector2 = cellArray{i, j};
        % ����ϲ�����������
        crossMergedVector = [];
        for k = 1:length(vector1)
            crossMergedVector = [crossMergedVector; vector1(k), vector2(k)];
        end
        % ������ϲ�����������洢�ڽ��Ԫ������ĵ�ǰλ��
        crossMergedArray{i, j} = crossMergedVector;%%%%PLTS������Ҫȥ������Ϊ0��
    end
end
PPP1=crossMergedArray;%%%û��ȥ������Ϊ0��PLTS
end
