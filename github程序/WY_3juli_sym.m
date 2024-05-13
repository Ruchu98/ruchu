function juli=WY_3juli_sym(A1,B1)
A = sortrows(A1, 1);%%%%%%%���ս�������
B = sortrows(B1, 1);
[m,n]=size(A);
[mm,nn]=size(B);

ci=max(m,mm);AA=[];
for i=1:m
    AA(:,i)=A(i,1)*A(i,2)+A(i,1)./6;
 
end

% ��ʼ�� BB
BB = cell(size(B, 1), mm);

% ѭ������
for i = 1:mm
    % ��ȡ���ű���
    sym_var1 = B(i, 1);
    sym_var2 = B(i, 2);
    
    % ������
    result = sym_var1 * sym_var2 + sym_var1 / sym(6);
    
    % ������洢�� BB ��
    BB(:, i) = {result};
end  % ����ѭ��



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
    
    matrix={AA;BB};
%     matrix=matrix./max(max(matrix));
% �������ű���
syms sym_var;

% �ҵ�������ֵ
max_abs_value = 0;
for i = 1:numel(matrix)
    % ��ȡ��ǰԪ���еķ��ű���
    sym_var = matrix{i};
    
    % ������ű����ľ���ֵ
    if isnumeric(sym_var)
        abs_sym_var = abs(sym_var); % �������ֵ��ֱ��ȡ����ֵ
    elseif isa(sym_var, 'sym')
        abs_sym_var = abs(sym_var); % ����Ƿ��ű�����ȡ����ֵ
%     else
%         error('Unsupported data type in matrix.');
    end
    
    % ����������ֵ
    max_abs_value = max(max_abs_value, double(abs_sym_var));
end

% ��һ�����洢Ϊ���ʽ
normalized_matrix = cell(size(matrix));
for i = 1:numel(matrix)
    % ��ȡ��ǰԪ���еķ��ű���
    sym_var = matrix{i};
    
    % ��һ�����ʽ
    if isnumeric(sym_var)
        normalized_expr = sym_var / max_abs_value; % �������ֵ��ֱ�ӹ�һ��
    elseif isa(sym_var, 'sym')
        normalized_expr = sym_var / sym(max_abs_value); % ����Ƿ��ű�����������һ���ķ��ű��ʽ
%     else
%         error('Unsupported data type in matrix.');
    end
    
    % �洢��һ����ı��ʽ
    normalized_matrix{i} = normalized_expr;
end




    
    % ��ȡ�����ά��
    [m, n] = size(normalized_matrix);
    
    % ��ʼ��һ�����������洢��������ʽ��ֵ
    determinants = [];
    
    % Ƕ��ѭ���������п��ܵ������
    for col1 = 1:n-1
        for col2 = col1+1:n
            % ��ȡ��ѡ��
            selected_columns = normalized_matrix(:, [col1, col2]);
            
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