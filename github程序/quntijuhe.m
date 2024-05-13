function DDD=quntijuhe(QQ)
PPP1=QQ{1};PPP2=QQ{2};PPP3=QQ{3};
PP1=wy_3_AP(PPP1,3);
PP2=wy_3_AP(PPP2,3);
PP3=wy_3_AP(PPP3,3);
Dd=wy_3_Agg(PP1,PP2);
Dd=wy_3_Agg(Dd, PP3);

% 创建一个空的元胞数组
DDD = cell(size(Dd,1), size(Dd,2));
% 填充元胞数组的每个位置
for i = 1:size(Dd,1)
    for j = 1:size(Dd,2)
        
        % 检查矩阵的第二列是否有0
        if any(Dd{i,j}(:, 2) == 0)
            % 如果第二列有0，则去掉具有0的那一行
            Dd{i,j}(Dd{i,j}(:, 2) == 0, :) = [];
        end
        % 将矩阵存储在元胞数组的当前位置
        DDD{i, j} = Dd{i,j};
    end
end

% 遍历元胞数组并替换空矩阵
for i = 1:size(DDD,1)
    for j = 1:size(DDD,2)
        if isempty(DDD{i, j}) % 检查当前位置是否为空矩阵
            % 如果为空矩阵，用7x2的零矩阵代替
            DDD{i, j} = zeros(7, 2);
        end
    end
end
%%%%%%%%%%%%%   DDD群体矩阵
end