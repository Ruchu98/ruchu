function GX=XG(XGG,QQ2,DDD,GP,ZP,DP)
for i = 1:length(XGG)
    for j=1:length(GP)
        QQ2{XGG(i),GP(j)}=wy_3_jf(QQ2{XGG(i),GP(j)},DDD{XGG(i),GP(j)},0.5);%%%%%%%%g高频属性集修改
    end
end
for i = 1:length(XGG)
    for j=1:length(ZP)
        QQ2{XGG(i),ZP(j)}=wy_3_jf(QQ2{XGG(i),ZP(j)},DDD{XGG(i),ZP(j)},0.5);%%%%%%%%中频属性集修改
    end
end
for i = 1:length(XGG)
    for j=1:length(DP)
        QQ2{XGG(i),DP(j)}=wy_3_jf(QQ2{XGG(i),DP(j)},DDD{XGG(i),DP(j)},1);%%%%%%%%低频属性集修改
    end
end



for i = 1:size(QQ2,1)
    for j = 1:size(QQ2,2)
        % 判断矩阵和是否为零
        if sum(sum(QQ2{i,j})) == 0
            % 如果矩阵和为零，则赋值为7x2的零矩阵
            QQ2{i, j} = zeros(7, 2);
        else
            % 否则，保持原始矩阵
            QQ2{i, j} = QQ2{i, j};
        end
    end
end
GX=QQ2;
end