clc
clear
load('PM1','PPP1');load('PM2','PPP2');load('PM3','PPP3');
for i=1:size(PPP1,1)
    for j=1:size(PPP1,2)
        G1(i,j)=WY_3defenhanshu(PPP1{i,j});
    end
end
for i=1:size(PPP1,1)
    for j=1:size(PPP1,2)
        G2(i,j)=WY_3defenhanshu(PPP2{i,j});
    end
end
for i=1:size(PPP1,1)
    for j=1:size(PPP1,2)
        G3(i,j)=WY_3defenhanshu(PPP3{i,j});
    end
end
save('GG','G1','G2','G3');