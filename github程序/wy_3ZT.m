clc
clear
close all
dy_diedai=[];
load('FA1','a1');load('SX1','s1');load('FA2','a2');load('SX2','s2');load('FA3','a3');load('SX3','s3');
aaa={a1,a2,a3};sss={s1,s2,s3};
%% 属性权重
S1=ones(1,9);S2=ones(1,9);S3=ones(1,9);
S1(s1)=0;S2(s2)=0;S3(s3)=0;
SQ1=(S1+S2+S3)./sum(S1+S2+S3);%%整体属性权重
SQ2=(S1+S2+S3)./sum(S1+S2+S3);%%整体属性权重
SQ3=(S1+S2+S3)./sum(S1+S2+S3);%%整体属性权重
wDD=SQ1;
%% 三分属性集
W=SQ1;%%整体属性权重
MS=max(W);IS=min(W);JJ=MS-(MS-IS)./3;ZJ=IS+(MS-IS)./3;
GP=find( (W > JJ & W <= MS));%%高频属性集
ZP=find( (W >= ZJ & W <= JJ));%%中频属性集
DP=find( (W >= IS & W < ZJ));%%低频属性集

%% 去掉方案之后的DM权重
SQ1(s1)=0;SQ2(s2)=0;SQ3(s3)=0;
w11=SQ1./sum(SQ1);w22=SQ2./sum(SQ2);w33=SQ3./sum(SQ3);
w1 = w11(w11 ~= 0);w2 = w22(w22 ~= 0);w3 = w33(w33 ~= 0);%%%%去掉属性之后的属性权重

for i=1:5
    yuzhi1111(i)=0.87+i/100;
end

for diedai1=1:5
    yuzhi=yuzhi1111(diedai1);
    for   diedai=1:1000 %%%%迭代随机次数
        PPP1=FFZZ;PPP2=FFZZ;PPP3=FFZZ;
        PPP1(a1, :) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};     
        PPP2(:, s2) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]}; 
        PPP2(a2, :) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]}; 
        PPP3(:, s3) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};
        PPP3(a3, :) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]}; 
        %% 聚合
        QQ={PPP1,PPP2,PPP3};
        DDD=quntijuhe(QQ);
        for i=1:size(DDD,1)
            for j=1:size(DDD,2)
                GW(i,j)=WY_3defenhanshu(DDD{i,j});
            end
        end
        GW1=sum(GW,1);
        GGW=sum(GW1.*wDD);
        [TEA,GWI,G_A,GGAA,GCI,woo,WWI,CCI,WWCCI,GAAP,GAA123]=gongshi(DDD,QQ);
        
        %% 识别
        dy=0;jiluWWI=[WWI];jiluCCI=[CCI];JL=[WWCCI];jlDDD={DDD};
        jl=[GWI];ji=[GCI];sxqz=[woo];
        
        while WWCCI<yuzhi
            [~,qqw]=min(GCI);%%%%须要修改的专家
            QQ2=QQ{qqw};%%%需要修改的专家矩阵
            XFA=GGAA(:,qqw);%%%%%识别到DM，接着三分找到对应需要修改的方案
            [~,XGG]=max(XFA);
            
            XGX=XG(XGG,QQ2,DDD,GP,ZP,DP);
            a_2=aaa{qqw};s_2=sss{qqw};
            XGX(a_2,:)={[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};%%%%%缺失的地方还是继续为空
            XGX(:, s_2) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};
            QQ{qqw}=XGX;%%%%更新过后的三个DM
            
            [~,qq]=min(GWI);%%%%须要修改的专家
            QQ1=QQ{qq};%%%需要修改的专家矩阵
            [fa,~]=find(TEA(:,qq)<yuzhi);%%%识别出所有专家都有问题的方案
            GX=XG(fa,QQ1,DDD,GP,ZP,DP);
            a_1=aaa{qq};s_1=sss{qq};
            GX(a_1,:)={[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};%%%%%缺失的地方还是继续为空
            GX(:, s_1) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};
            QQ{qq}=GX;%%%%更新过后的三个DM
            
            DDD=quntijuhe(QQ);%%%%%新的聚合矩阵
            [TEA,GWI,G_A,GGAA,GCI,woo,WWI,CCI,WWCCI,GAAP,GAA123]=gongshi(DDD,QQ);
            jiluWWI=[jiluWWI,WWI];%%记录每次基数共识水平
            jiluCCI=[jiluCCI,CCI];%%记录每一次序共识水平
            JL=[JL,WWCCI];%记录每一次集体共识水平
            
            jl=[jl;GWI];ji=[ji;GCI];%%记录每一次每个DM的序数基数共识水平
            dy=dy+1;
            jlDDD(dy)={DDD};
            jiluQQ(dy)={QQ};
            sxqz=[sxqz;woo];%%%%DM权重
            jiluqq(dy)=qq;jiluqqw(dy)=qqw;
            if length(JL)>5
                break;
            end
        end
        dy_diedai(diedai,diedai1)=dy;
    end
end
save('DY','dy_diedai')