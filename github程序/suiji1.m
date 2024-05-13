function PPP1=suiji1
PPP1 = cell(50, 9);
% 随机生成元胞数组
for i = 1:50
    for j = 1:9
        % 随机生成第一列向量，元素在0到6之间
        col1 = round(rand(1, 1) * 6);
        
        % 随机生成第二列向量，元素在0到1之间
        col2 = rand(1, 1);
        
        % 计算第二列向量的元素之和
        sum_col2 = sum(col2);
        
        % 确保第二列向量的元素之和为1
        col2 = col2 / sum_col2;
        
        % 存储在元胞数组中
        PPP1{i, j} = [col1, col2];
    end
end
end
% save('PM1','PPP1')