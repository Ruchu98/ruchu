clc
clear
close all
load('gxQQ','jiluQQ11');
load('PM1','PPP1');load('PM2','PPP2');load('PM3','PPP3');
QQ={PPP1,PPP2,PPP3};
for k=1:size(jiluQQ11,2)
    for i=1:size(jiluQQ11{1},1)
        for j=1:size(jiluQQ11{1},2)
            gzQQ{k}{i,j}=hebing(jiluQQ11{k}{i,j});
        end
    end
end
for k=1:size(QQ,2)
    for i=1:size(QQ{1},1)
        for j=1:size(QQ{1},2)
            ylQQ{k}{i,j}=hebing(QQ{k}{i,j});
        end
    end
end
for k=1:size(QQ,2)
    for i=1:size(QQ{1},1)
        for j=1:size(QQ{1},2)
            jjzz{k}(i,j)=isequal(gzQQ{k}{i,j}, ylQQ{k}{i,j});
        end
    end
end
for k=1:size(QQ,2)
    for i=1:size(QQ{1},1)
        for j=1:size(QQ{1},2)
            fzl{k}(i,j)=1-jjzz{k}(i,j);%%%改变了的是1，不变的是0
        end
    end
end
for k=1:size(QQ,2)
    fangan{k}=sum(fzl{k},2);
end
for k=1:size(fangan,2)
    for i=1:size(fangan{1},1)
        for j=1:size(fangan{1},2)
          if fangan{k}(i,j)~=0
              fangan{k}(i,j)=1;
          end
        end
    end
end
for k=1:size(fangan,2)
     FA{k} =sum(fangan{k});
end
FAGS=sum(cell2mat(FA));%%%%修改方案个数          
   
for k=1:size(QQ,2)
    pjz{k}=sum(fzl{k});
end
ppjjzzz=sum(cell2mat(pjz));%%%评价值个数

for k=1:size(QQ,2)
    for i=1:size(QQ{1},1)
        for j=1:size(QQ{1},2)
            AD{k}(i,j)=WY_3juli(gzQQ{k}{i,j}, ylQQ{k}{i,j});
        end
    end
end
cbb=sum(sum((AD{2}+AD{3})./(50*9)));%%%%成本


