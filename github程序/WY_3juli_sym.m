function juli=WY_3juli_sym(A1,B1)
A = sortrows(A1, 1);%%%%%%%按照降序排列
B = sortrows(B1, 1);
[m,n]=size(A);
[mm,nn]=size(B);

ci=max(m,mm);AA=[];
for i=1:m
    AA(:,i)=A(i,1)*A(i,2)+A(i,1)./6;
 
end

% 初始化 BB
BB = cell(size(B, 1), mm);

% 循环计算
for i = 1:mm
    % 提取符号变量
    sym_var1 = B(i, 1);
    sym_var2 = B(i, 2);
    
    % 计算结果
    result = sym_var1 * sym_var2 + sym_var1 / sym(6);
    
    % 将结果存储到 BB 中
    BB(:, i) = {result};
end  % 结束循环



% 判断两个向量的长度
len1 = length(AA);
len2 = length(BB);
if len1==1&&len2==1
    juli=abs(AA-BB)./7;
else
    % 找到较长的向量的长度
    max_len = max(len1, len2);
    
    % 补齐较短的向量，使其长度与较长的向量相同
    if len1 < max_len
        AA = [AA, zeros(1, max_len - len1)];
    elseif len2 < max_len
        BB = [BB, zeros(1, max_len - len2)];
    end
    
    matrix={AA;BB};
%     matrix=matrix./max(max(matrix));
% 声明符号变量
syms sym_var;

% 找到最大绝对值
max_abs_value = 0;
for i = 1:numel(matrix)
    % 获取当前元胞中的符号变量
    sym_var = matrix{i};
    
    % 计算符号变量的绝对值
    if isnumeric(sym_var)
        abs_sym_var = abs(sym_var); % 如果是数值，直接取绝对值
    elseif isa(sym_var, 'sym')
        abs_sym_var = abs(sym_var); % 如果是符号变量，取绝对值
%     else
%         error('Unsupported data type in matrix.');
    end
    
    % 更新最大绝对值
    max_abs_value = max(max_abs_value, double(abs_sym_var));
end

% 归一化并存储为表达式
normalized_matrix = cell(size(matrix));
for i = 1:numel(matrix)
    % 获取当前元胞中的符号变量
    sym_var = matrix{i};
    
    % 归一化表达式
    if isnumeric(sym_var)
        normalized_expr = sym_var / max_abs_value; % 如果是数值，直接归一化
    elseif isa(sym_var, 'sym')
        normalized_expr = sym_var / sym(max_abs_value); % 如果是符号变量，构建归一化的符号表达式
%     else
%         error('Unsupported data type in matrix.');
    end
    
    % 存储归一化后的表达式
    normalized_matrix{i} = normalized_expr;
end




    
    % 获取矩阵的维度
    [m, n] = size(normalized_matrix);
    
    % 初始化一个空数组来存储所有行列式的值
    determinants = [];
    
    % 嵌套循环遍历所有可能的列组合
    for col1 = 1:n-1
        for col2 = col1+1:n
            % 提取所选列
            selected_columns = normalized_matrix(:, [col1, col2]);
            
            % 计算行列式的值并存储到数组中
            determinant_value = abs(det(selected_columns));
            determinants = [determinants, determinant_value];
            
%             % 显示当前组合的行列式值
%             disp(['列组合 [', num2str(col1), ', ', num2str(col2), ']: ', num2str(determinant_value)]);
        end
    end
%    determinants=determinants./max(determinants);
    juli=sum(determinants)./(length(determinants));
    
end
end