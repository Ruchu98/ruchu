function GX=ZSXG(qqw,XGG,QQ2,QQ,DDD,G_A,GP,ZP,DP)
Q_Q1={QQ{1},QQ{2},QQ{3}};
for i=1:size(QQ2,1)
    for j=1:size(QQ2,2)
        G1(i,j)=WY_3defenhanshu(Q_Q1{1}{i,j});
    end
end
for i=1:size(QQ2,1)
    for j=1:size(QQ2,2)
        G2(i,j)=WY_3defenhanshu(Q_Q1{2}{i,j});
    end
end
for i=1:size(QQ2,1)
    for j=1:size(QQ2,2)
        G3(i,j)=WY_3defenhanshu(Q_Q1{3}{i,j});
    end
end
% for i=1:size(DDD,1)
%     for j=1:size(DDD,2)
%         G4(i,j)=WY_3defenhanshu(DDD{i,j});
%     end
% end

GG1=sum(G1,2);GG2=sum(G2,2);GG3=sum(G3,2);
% GG4=sum(G4,2);
GG_G=[GG1,GG2,GG3];
% [~,FA]=max(GG);[~,FAA]=min(GG);
GAa=G_A(:,qqw);%%%判断序共识到底是增加排序还是减少排序
for i=1:length(XGG)
 Gm(i,:)=GG_G(XGG(i),:);
end
[~, famax] = max(Gm, [], 2); % 沿着维度2查找最大值和其列序号
[~, famin] = min(Gm, [], 2); % 沿着维度2查找最小值和其列序号


for i=1:length(XGG)
    if GAa(XGG(i))<0%%%%%%%%%%需要提高
        for j=1:length(GP)
            QQ2{XGG(i),GP(j)}=wy_3_jf(QQ2{XGG(i),GP(j)},Q_Q1{famax(i)}{XGG(i),GP(j)},0.5);%%%%%%%%g高频属性集修改
        end
        for j=1:length(ZP)
            QQ2{XGG(i),ZP(j)}=wy_3_jf(QQ2{XGG(i),ZP(j)},Q_Q1{famax(i)}{XGG(i),ZP(j)},0.5);%%%%%%%%中频属性集修改
        end
        for j=1:length(DP)
            QQ2{XGG(i),DP(j)}=wy_3_jf(QQ2{XGG(i),DP(j)},Q_Q1{famax(i)}{XGG(i),DP(j)},1);%%%%%%%%低频属性集修改
        end
    end
end
for i=1:length(XGG)
   if  GAa(XGG(i))>0%%%%需要降低
        for j=1:length(GP)
            QQ2{XGG(i),GP(j)}=wy_3_jf(QQ2{XGG(i),GP(j)},Q_Q1{famin(i)}{XGG(i),GP(j)},0.5);%%%%%%%%g高频属性集修改
        end
        for j=1:length(ZP)
            QQ2{XGG(i),ZP(j)}=wy_3_jf(QQ2{XGG(i),ZP(j)},Q_Q1{famin(i)}{XGG(i),ZP(j)},0.5);%%%%%%%%中频属性集修改
        end
        for j=1:length(DP)
            QQ2{XGG(i),DP(j)}=wy_3_jf(QQ2{XGG(i),DP(j)},Q_Q1{famin(i)}{XGG(i),DP(j)},1);%%%%%%%%低频属性集修改
        end
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