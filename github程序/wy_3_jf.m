function result_matrix=wy_3_jf(A,B,r)
tao=6;
i1=length(A(:,1));
i2=length(B(:,1));
T=1;
for t1=1:i1
    for t2=1:i2
        CD(T,1)=(1-r).*A(t1,1)+r.*B(t2,1);
        CD(T,2)=A(t1,2).*B(t2,2);
        T=T+1;
    end
end
for t=1:i1*i2
    if CD(t,1)>tao
         CD(t,1)=tao;
    elseif CD(t,1)<0
         CD(t,1)=0;
    end
end

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
