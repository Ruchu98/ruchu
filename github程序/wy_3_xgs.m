function xgs=wy_3_xgs(vector1,vector2)
% ��ʼ��һ�����������ڴ洢���
results = zeros(size(vector1));

% ����������ÿ��λ��
for i = 1:length(vector1)
    % �ж����������ж�Ӧλ�õ�Ԫ���Ƿ����
    if vector1(i) == vector2(i)
        results(i) = 0; % �����ȣ���Ϊ0
    else
        % �������ȣ��ҵ���һ�������е���ͬԪ�ز���¼λ�ò�
        matching_element_index = find(vector2 == vector1(i));
        if ~isempty(matching_element_index)
            results(i) = abs(matching_element_index - i)./(length(vector1)-1);
        end
    end
end
xgs=1-sum(results)./(length(vector1));
end


% % % ����������ÿ��λ��
% % for i = 1:length(vector1)
% %     % �ж����������ж�Ӧλ�õ�Ԫ���Ƿ����
% %     if vector1(i) == vector2(i)
% %         results(i) = 0; % �����ȣ���Ϊ0
% %     else
% %         % �������ȣ��ҵ���һ�������е���ͬԪ�ز���¼λ�ò�
% %         matching_element_index = find(vector2 == vector1(i));
% %         if ~isempty(matching_element_index)
% %             results(i) = abs(matching_element_index - i);
% %         end
% %     end
% % end
% %   resultS=sum(results)./(xgxfenmu(length(vector1)))
% % xgs=1-sum(resultS);
% % end






