function PPP1=suiji1
PPP1 = cell(50, 9);
% �������Ԫ������
for i = 1:50
    for j = 1:9
        % ������ɵ�һ��������Ԫ����0��6֮��
        col1 = round(rand(1, 1) * 6);
        
        % ������ɵڶ���������Ԫ����0��1֮��
        col2 = rand(1, 1);
        
        % ����ڶ���������Ԫ��֮��
        sum_col2 = sum(col2);
        
        % ȷ���ڶ���������Ԫ��֮��Ϊ1
        col2 = col2 / sum_col2;
        
        % �洢��Ԫ��������
        PPP1{i, j} = [col1, col2];
    end
end
end
% save('PM1','PPP1')