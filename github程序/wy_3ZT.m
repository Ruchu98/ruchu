clc
clear
close all
dy_diedai=[];
load('FA1','a1');load('SX1','s1');load('FA2','a2');load('SX2','s2');load('FA3','a3');load('SX3','s3');
aaa={a1,a2,a3};sss={s1,s2,s3};
%% ����Ȩ��
S1=ones(1,9);S2=ones(1,9);S3=ones(1,9);
S1(s1)=0;S2(s2)=0;S3(s3)=0;
SQ1=(S1+S2+S3)./sum(S1+S2+S3);%%��������Ȩ��
SQ2=(S1+S2+S3)./sum(S1+S2+S3);%%��������Ȩ��
SQ3=(S1+S2+S3)./sum(S1+S2+S3);%%��������Ȩ��
wDD=SQ1;
%% �������Լ�
W=SQ1;%%��������Ȩ��
MS=max(W);IS=min(W);JJ=MS-(MS-IS)./3;ZJ=IS+(MS-IS)./3;
GP=find( (W > JJ & W <= MS));%%��Ƶ���Լ�
ZP=find( (W >= ZJ & W <= JJ));%%��Ƶ���Լ�
DP=find( (W >= IS & W < ZJ));%%��Ƶ���Լ�

%% ȥ������֮���DMȨ��
SQ1(s1)=0;SQ2(s2)=0;SQ3(s3)=0;
w11=SQ1./sum(SQ1);w22=SQ2./sum(SQ2);w33=SQ3./sum(SQ3);
w1 = w11(w11 ~= 0);w2 = w22(w22 ~= 0);w3 = w33(w33 ~= 0);%%%%ȥ������֮�������Ȩ��

for i=1:5
    yuzhi1111(i)=0.87+i/100;
end

for diedai1=1:5
    yuzhi=yuzhi1111(diedai1);
    for   diedai=1:1000 %%%%�����������
        PPP1=FFZZ;PPP2=FFZZ;PPP3=FFZZ;
        PPP1(a1, :) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};     
        PPP2(:, s2) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]}; 
        PPP2(a2, :) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]}; 
        PPP3(:, s3) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};
        PPP3(a3, :) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]}; 
        %% �ۺ�
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
        
        %% ʶ��
        dy=0;jiluWWI=[WWI];jiluCCI=[CCI];JL=[WWCCI];jlDDD={DDD};
        jl=[GWI];ji=[GCI];sxqz=[woo];
        
        while WWCCI<yuzhi
            [~,qqw]=min(GCI);%%%%��Ҫ�޸ĵ�ר��
            QQ2=QQ{qqw};%%%��Ҫ�޸ĵ�ר�Ҿ���
            XFA=GGAA(:,qqw);%%%%%ʶ��DM�����������ҵ���Ӧ��Ҫ�޸ĵķ���
            [~,XGG]=max(XFA);
            
            XGX=XG(XGG,QQ2,DDD,GP,ZP,DP);
            a_2=aaa{qqw};s_2=sss{qqw};
            XGX(a_2,:)={[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};%%%%%ȱʧ�ĵط����Ǽ���Ϊ��
            XGX(:, s_2) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};
            QQ{qqw}=XGX;%%%%���¹��������DM
            
            [~,qq]=min(GWI);%%%%��Ҫ�޸ĵ�ר��
            QQ1=QQ{qq};%%%��Ҫ�޸ĵ�ר�Ҿ���
            [fa,~]=find(TEA(:,qq)<yuzhi);%%%ʶ�������ר�Ҷ�������ķ���
            GX=XG(fa,QQ1,DDD,GP,ZP,DP);
            a_1=aaa{qq};s_1=sss{qq};
            GX(a_1,:)={[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};%%%%%ȱʧ�ĵط����Ǽ���Ϊ��
            GX(:, s_1) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};
            QQ{qq}=GX;%%%%���¹��������DM
            
            DDD=quntijuhe(QQ);%%%%%�µľۺϾ���
            [TEA,GWI,G_A,GGAA,GCI,woo,WWI,CCI,WWCCI,GAAP,GAA123]=gongshi(DDD,QQ);
            jiluWWI=[jiluWWI,WWI];%%��¼ÿ�λ�����ʶˮƽ
            jiluCCI=[jiluCCI,CCI];%%��¼ÿһ����ʶˮƽ
            JL=[JL,WWCCI];%��¼ÿһ�μ��干ʶˮƽ
            
            jl=[jl;GWI];ji=[ji;GCI];%%��¼ÿһ��ÿ��DM������������ʶˮƽ
            dy=dy+1;
            jlDDD(dy)={DDD};
            jiluQQ(dy)={QQ};
            sxqz=[sxqz;woo];%%%%DMȨ��
            jiluqq(dy)=qq;jiluqqw(dy)=qqw;
            if length(JL)>5
                break;
            end
        end
        dy_diedai(diedai,diedai1)=dy;
    end
end
save('DY','dy_diedai')