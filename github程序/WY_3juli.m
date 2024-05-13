function juli=WY_3juli(A1,B1)
A = sortrows(A1, 1);%%%%%%%按照降序排列
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
    
    matrix=[AA;BB];
    matrix=matrix./max(max(matrix));
    
    % 获取矩阵的维度
    [m, n] = size(matrix);
    
    % 初始化一个空数组来存储所有行列式的值
    determinants = [];
    
    % 嵌套循环遍历所有可能的列组合
    for col1 = 1:n-1
        for col2 = col1+1:n
            % 提取所选列
            selected_columns = matrix(:, [col1, col2]);
            
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