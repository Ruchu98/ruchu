function xgs=wy_3_xgs(vector1,vector2)
% 初始化一个空数组用于存储结果
results = zeros(size(vector1));

% 遍历向量的每个位置
for i = 1:length(vector1)
    % 判断两个向量中对应位置的元素是否相等
    if vector1(i) == vector2(i)
        results(i) = 0; % 如果相等，记为0
    else
        % 如果不相等，找到另一个向量中的相同元素并记录位置差
        matching_element_index = find(vector2 == vector1(i));
        if ~isempty(matching_element_index)
            results(i) = abs(matching_element_index - i)./(length(vector1)-1);
        end
    end
end
xgs=1-sum(results)./(length(vector1));
end


% % % 遍历向量的每个位置
% % for i = 1:length(vector1)
% %     % 判断两个向量中对应位置的元素是否相等
% %     if vector1(i) == vector2(i)
% %         results(i) = 0; % 如果相等，记为0
% %     else
% %         % 如果不相等，找到另一个向量中的相同元素并记录位置差
% %         matching_element_index = find(vector2 == vector1(i));
% %         if ~isempty(matching_element_index)
% %             results(i) = abs(matching_element_index - i);
% %         end
% %     end
% % end
% %   resultS=sum(results)./(xgxfenmu(length(vector1)))
% % xgs=1-sum(resultS);
% % end






