function result_matrix=hebing(CD)
% �ҵ���һ���е�ΨһԪ��
unique_first_col = unique(CD(:, 1));
% ��ʼ��һ���վ������洢���
result_matrix = [];
% ����Ψһ�ĵ�һ��Ԫ��
for i = 1:length(unique_first_col)
    current_value = unique_first_col(i);
    % �ҵ���һ�е��ڵ�ǰֵ����
    matching_rows = CD(CD(:, 1) == current_value, :);
    % ����ڶ��е��ܺ�
    sum_second_col = sum(matching_rows(:, 2));
    % �������ӵ��¾���
    result_matrix = [result_matrix; current_value, sum_second_col];
end
end