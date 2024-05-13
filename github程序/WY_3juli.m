function juli=WY_3juli(A1,B1)
A = sortrows(A1, 1);%%%%%%%���ս�������
B = sortrows(B1, 1);
[m,n]=size(A);
[mm,nn]=size(B);


ci=max(m,mm);AA=[];BB=[];
for i=1:m
    AA(:,i)=A(i,1)*A(i,2)+A(i,1)./6+0.00000001;
 
end
for i=1:mm
    BB(:,i)=B(i,1)*B(i,2)+B(i,1)./6+0.00000001;
end

% �ж����������ĳ���
len1 = length(AA);
len2 = length(BB);
if len1==1&&len2==1
    juli=abs(AA-BB)./7;
else
    % �ҵ��ϳ��������ĳ���
    max_len = max(len1, len2);
    
    % ����϶̵�������ʹ�䳤����ϳ���������ͬ
    if len1 < max_len
        AA = [AA, zeros(1, max_len - len1)];
    elseif len2 < max_len
        BB = [BB, zeros(1, max_len - len2)];
    end
    
    matrix=[AA;BB];
    matrix=matrix./max(max(matrix));
    
    % ��ȡ�����ά��
    [m, n] = size(matrix);
    
    % ��ʼ��һ�����������洢��������ʽ��ֵ
    determinants = [];
    
    % Ƕ��ѭ���������п��ܵ������
    for col1 = 1:n-1
        for col2 = col1+1:n
            % ��ȡ��ѡ��
            selected_columns = matrix(:, [col1, col2]);
            
            % ��������ʽ��ֵ���洢��������
            determinant_value = abs(det(selected_columns));
            determinants = [determinants, determinant_value];
            
%             % ��ʾ��ǰ��ϵ�����ʽֵ
%             disp(['����� [', num2str(col1), ', ', num2str(col2), ']: ', num2str(determinant_value)]);
        end
    end
%    determinants=determinants./max(determinants);
    juli=sum(determinants)./(length(determinants));
    
end
end