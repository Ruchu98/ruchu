function result_matrix=hebing(CD)
% 找到第一列中的唯一元素
unique_first_col = unique(CD(:, 1));
% 初始化一个空矩阵来存储结果
result_matrix = [];
% 遍历唯一的第一列元素
for i = 1:length(unique_first_col)
    current_value = unique_first_col(i);
    % 找到第一列等于当前值的行
    matching_rows = CD(CD(:, 1) == current_value, :);
    % 计算第二列的总和
    sum_second_col = sum(matching_rows(:, 2));
    % 将结果添加到新矩阵
    result_matrix = [result_matrix; current_value, sum_second_col];
end
end