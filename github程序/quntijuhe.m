function DDD=quntijuhe(QQ)
PPP1=QQ{1};PPP2=QQ{2};PPP3=QQ{3};
PP1=wy_3_AP(PPP1,3);
PP2=wy_3_AP(PPP2,3);
PP3=wy_3_AP(PPP3,3);
Dd=wy_3_Agg(PP1,PP2);
Dd=wy_3_Agg(Dd, PP3);

% ����һ���յ�Ԫ������
DDD = cell(size(Dd,1), size(Dd,2));
% ���Ԫ�������ÿ��λ��
for i = 1:size(Dd,1)
    for j = 1:size(Dd,2)
        
        % ������ĵڶ����Ƿ���0
        if any(Dd{i,j}(:, 2) == 0)
            % ����ڶ�����0����ȥ������0����һ��
            Dd{i,j}(Dd{i,j}(:, 2) == 0, :) = [];
        end
        % ������洢��Ԫ������ĵ�ǰλ��
        DDD{i, j} = Dd{i,j};
    end
end

% ����Ԫ�����鲢�滻�վ���
for i = 1:size(DDD,1)
    for j = 1:size(DDD,2)
        if isempty(DDD{i, j}) % ��鵱ǰλ���Ƿ�Ϊ�վ���
            % ���Ϊ�վ�����7x2����������
            DDD{i, j} = zeros(7, 2);
        end
    end
end
%%%%%%%%%%%%%   DDDȺ�����
end