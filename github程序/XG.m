function GX=XG(XGG,QQ2,DDD,GP,ZP,DP)
for i = 1:length(XGG)
    for j=1:length(GP)
        QQ2{XGG(i),GP(j)}=wy_3_jf(QQ2{XGG(i),GP(j)},DDD{XGG(i),GP(j)},0.5);%%%%%%%%g��Ƶ���Լ��޸�
    end
end
for i = 1:length(XGG)
    for j=1:length(ZP)
        QQ2{XGG(i),ZP(j)}=wy_3_jf(QQ2{XGG(i),ZP(j)},DDD{XGG(i),ZP(j)},0.5);%%%%%%%%��Ƶ���Լ��޸�
    end
end
for i = 1:length(XGG)
    for j=1:length(DP)
        QQ2{XGG(i),DP(j)}=wy_3_jf(QQ2{XGG(i),DP(j)},DDD{XGG(i),DP(j)},1);%%%%%%%%��Ƶ���Լ��޸�
    end
end



for i = 1:size(QQ2,1)
    for j = 1:size(QQ2,2)
        % �жϾ�����Ƿ�Ϊ��
        if sum(sum(QQ2{i,j})) == 0
            % ��������Ϊ�㣬��ֵΪ7x2�������
            QQ2{i, j} = zeros(7, 2);
        else
            % ���򣬱���ԭʼ����
            QQ2{i, j} = QQ2{i, j};
        end
    end
end
GX=QQ2;
end