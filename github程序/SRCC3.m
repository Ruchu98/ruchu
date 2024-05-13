clc
clear
close all

WY=xlsread('C:\Users\DELL\Desktop\王羽第三篇\对比程序\wy3位置序.xlsx','A2:A51')';
XU=xlsread('C:\Users\DELL\Desktop\王羽第三篇\对比程序\wy3位置序.xlsx','B2:B51')';
HXR=xlsread('C:\Users\DELL\Desktop\王羽第三篇\对比程序\wy3位置序.xlsx','C2:C51')';
ZJX =xlsread('C:\Users\DELL\Desktop\王羽第三篇\对比程序\wy3位置序.xlsx','D2:D51')';
WXL=xlsread('C:\Users\DELL\Desktop\王羽第三篇\对比程序\wy3位置序.xlsx','E2:E51')';
zhou=xlsread('C:\Users\DELL\Desktop\王羽第三篇\对比程序\wy3位置序.xlsx','F2:F51')';
tang=xlsread('C:\Users\DELL\Desktop\王羽第三篇\对比程序\wy3位置序.xlsx','G2:G51')';

A=[WY;XU;HXR;ZJX;WXL;zhou;tang];
[a,b]=size(A);
B=[];
for c=1:a
    C=A(c,:);
    [D,IX]=sort(C);
    B=[B;IX];%%排序位置，作图用
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
