function result=xgxfenmu(n)
% 初始化结果为 1
result =0;
if mod(n,2)==1
    % 计算连乘的值
    for k = 1:2:n-2
        result = result + (n - k);
    end
else
    for k = 1:2:n-1
        result = result + (n - k);
    end
end
end

