function result_matrix = wy_3_jf_syms(A, B, r)
    tao = 6; % 将 tao 定义为数值常量
    
    i1 = length(A);
    i2 = length(B);
    T = 1;
    CD = sym(zeros(i1 * i2, 2)); % 将 CD 初始化为符号数组
    for t1 = 1:i1
        for t2 = 1:i2
            CD(T,1) = (1-r)*A(t1) + r*B(t2);
            CD(T,2) = A(t1)*B(t2);
            T = T + 1;
        end
    end
    
tao_sym = sym(tao); % 将 tao 转换为符号对象

for t = 1:i1*i2
    if sym(CD(t,1) > tao_sym) == true
        CD(t,1) = tao_sym;
    elseif sym(CD(t,1) < sym(0)) == true
        CD(t,1) = sym(0);
    end
end




    unique_first_col = unique(CD(:, 1));
    result_matrix = [];
    for i = 1:length(unique_first_col)
        current_value = unique_first_col(i);
        matching_rows = CD(CD(:, 1) == current_value, :);
        sum_second_col = sum(matching_rows(:, 2));
        result_matrix = [result_matrix; current_value, sum_second_col];
    end
end
