clc
clear
close all

WY=xlsread('C:\Users\DELL\Desktop\�������ƪ\�Աȳ���\wy3λ����.xlsx','A2:A51')';
XU=xlsread('C:\Users\DELL\Desktop\�������ƪ\�Աȳ���\wy3λ����.xlsx','B2:B51')';
HXR=xlsread('C:\Users\DELL\Desktop\�������ƪ\�Աȳ���\wy3λ����.xlsx','C2:C51')';
ZJX =xlsread('C:\Users\DELL\Desktop\�������ƪ\�Աȳ���\wy3λ����.xlsx','D2:D51')';
WXL=xlsread('C:\Users\DELL\Desktop\�������ƪ\�Աȳ���\wy3λ����.xlsx','E2:E51')';
zhou=xlsread('C:\Users\DELL\Desktop\�������ƪ\�Աȳ���\wy3λ����.xlsx','F2:F51')';
tang=xlsread('C:\Users\DELL\Desktop\�������ƪ\�Աȳ���\wy3λ����.xlsx','G2:G51')';

A=[WY;XU;HXR;ZJX;WXL;zhou;tang];
[a,b]=size(A);
B=[];
for c=1:a
    C=A(c,:);
    [D,IX]=sort(C);
    B=[B;IX];%%����λ�ã���ͼ��
end
B=B;
P=[];
for a1=1:a
    P1=[];
    for a2=1:a
    pi=1-(6.*(sum((B(a1,:)-B(a2,:)).^2)))./(b.*(b.^2-1));
    P1=[P1;pi];
    end
    P=[P,P1];
end
P=P;
