function result=xgxfenmu(n)
% ��ʼ�����Ϊ 1
result =0;
if mod(n,2)==1
    % �������˵�ֵ
    for k = 1:2:n-2
        result = result + (n - k);
    end
else
    for k = 1:2:n-1
        result = result + (n - k);
    end
end
end

