clc
clear
close all
A=xlsread('C:\Users\DELL\Desktop\�������ƪ\�����ʾ�����\1-25��.xlsx','H2:DQK39');
m=size(A,2)./7;
for i=1:size(A,1)
    for j=1:m
        s= (j - 1) *7 + 1;
        e=j*7;
        B{i,j}=A(i,s:e);
    end
end
m1=size(B,2)./9;
for i=1:size(A,1)
    E{i,:}=reshape(B(i,:),9,50)';%%%%%%%%%DM������ֵԭʼ����
end
for i=1:size(A,1)
    F{i,:}=sum(cell2mat(E{i}),2)';
end
zeroCountPerColumn = sum(cell2mat(F) == 0);
a1=find(zeroCountPerColumn>=19);%%ȱʧ����

% �ж������Ƿ�ȱʧ
for k=1:size(E,1)
    for i=1:size(E{1},1)
        for j=1:size(E{1},2)
            G{k,:}(i,j)=sum(cell2mat(E{k}(i,j)));%%%%%%%%%�������DM��ͬ����λ�ö�û�����ۣ���Ϊȱʧ
        end
    end
end
zeroCount = sum(cat(3, G{:}) == 0, 3);
S=sum(zeroCount,1)./(38*50);%%ÿ������û�п��ǵ�DM������
MS=max(S);IS=min(S);JJ=MS-(MS-IS)./3;
s1=find( (S >= JJ & S <= MS));%%%ȱʧ������


%% תPLTS����
% ��ʼ��һ����Ԫ��������ͬ��С�Ŀ�Ԫ������
R = cell(size(E{1},1),size(E{1},2));
for i=1:size(E{1},1)
    for j=1:size(E{1},2)
        % ��ʼ����ǰλ�õĽ��������
        sumVector = zeros(size(E{1}{i, j}));
        % ����ͬλ�õ��������������
        for k=1:size(E,1)
            cuu = E{k}{i, j};
            sumVector = sumVector + cuu;
        end
        % ����ӽ���洢�����Ԫ��������
        R{i, j} = sumVector;
    end
end

% ����һ����Ԫ��������ͬ��С�Ŀյ�Ԫ������
GL = cell(size(R, 1),  size(R, 2));
% ��Ԫ��������ÿ��λ�õ����������в���
for i = 1:size(R, 1)
    for j = 1: size(R, 2)
        % ��ȡ��ǰλ�õ�������
        cv = R{i, j};
        % �����������ĺ�
        vectorSum = sum(cv);
        % �������������������ĺ�
        normalizedVector = cv / vectorSum;
        % ����һ������������洢�����Ԫ�������е���ͬλ��
        GL{i, j} = normalizedVector;%%%���ʳ�����
    end
end


% ����һ������������[0, 1, 2, 3, 4, 5, 6]��ģ������
templateVector = [0, 0.33, 0.5, 0.5, 0.5, 0.67, 1];

% ����һ���յ�Ԫ������
XB = cell(size(R, 1),  size(R, 2));

% ���Ԫ�������ÿ��λ��
for i = 1:size(R, 1)
    for j = 1:size(R, 2)
        XB{i, j} = templateVector;
    end
end
%% �����ʺ��±�ϲ�
% ��ȡԪ������Ĵ�С
[numRows, numCols] = size(XB);

% ����һ���յ�Ԫ���������洢����ϲ��Ľ��
crossMergedArray = cell(numRows, numCols);

% ����ϲ�����Ԫ������
for i = 1:numRows
    for j = 1:numCols
        % �ӵ�һ��Ԫ�������ȡ��ǰλ�õ�������
        vector1 =XB{i, j};
        % �ӵڶ���Ԫ�������ȡ��ǰλ�õ�������
        vector2 = GL{i, j};
        % ����ϲ�����������
        crossMergedVector = [];
        for k = 1:length(vector1)
            crossMergedVector = [crossMergedVector; vector1(k), vector2(k)];
        end
        % ������ϲ�����������洢�ڽ��Ԫ������ĵ�ǰλ��
        crossMergedArray{i, j} = crossMergedVector;%%%%PLTS������Ҫȥ������Ϊ0��
    end
end
PPP1=crossMergedArray;%%%û��ȥ������Ϊ0��PLTS

% ����һ���յ�Ԫ������
PLTS = cell(numRows, numCols);

% ���Ԫ�������ÿ��λ��
for i = 1:numRows
    for j = 1:numCols
        
        % ������ĵڶ����Ƿ���0
        if any(crossMergedArray{i,j}(:, 2) == 0)
            % ����ڶ�����0����ȥ������0����һ��
            crossMergedArray{i,j}(crossMergedArray{i,j}(:, 2) == 0, :) = [];
        end
        
        % ������洢��Ԫ������ĵ�ǰλ��
        PLTS{i, j} = crossMergedArray{i,j};
    end
end
PPP1=PLTS;

%% ȥ������������
PLTS(a1, :) = [];  % ȥ��ָ������
PLTS(:, s1) = [];  % ȥ��ָ������
DM1=PLTS;
GL(a1, :) = [];  % ȥ��ָ������
GL(:, s1) = [];  % ȥ��ָ������
PPP1(a1, :) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};  
PPP1(:, s1) = {[0,0;0,0;0,0;0,0;0,0;0,0;0,0]};  





save('DM1','DM1')
save('PM1','PPP1')
save('FA1','a1')
save('SX1','s1')
%  w1=[0.166666666666667,0.250000000000000,0.166666666666667,0.250000000000000,0.166666666666667];
% w1=[0.125000000000000,0.187500000000000,0.125000000000000,0.0625000000000000,0.0625000000000000,0.187500000000000,0.125000000000000,0.0625000000000000,0.0625000000000000]
% % %% �����������
% % 
% % % ѭ������ÿ��Ԫ���������������Ԫ�أ����г˷�����
% % for i = 1:48
% %     for j = 1:5
% %         GL{i, j} = GL{i, j} *w1(j);
% %     end
% % end
% % 
% % sumArray = zeros(1, 7); % ��ʼ��һ������������С��ͬ��������
% % 
% % for i = 1:48
% %     for j = 1:5
% %         % ����ǰλ�õ����������Ӧ��λ�����
% %         sumArray = sumArray + GL{i, j};
% %     end
% % end


% % o=[2 3 5 6];
% % mubiao= sumArray(o);
% % f=-[0.584490691479300,5.29574187717636,9.11932887770916,10.1791497094616];
% % A=[ 1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
% % b=[2/6;3/6;5/6;1];
% % Aeq=[1 0 0 1; 0 1 1 0];
% % beq=[1;1];
% % vlb=[0,1/6,3/6,4/6];
% % vub=[];    
% % [x,fval]=linprog(f,A,b,Aeq,beq,vlb,vub)





















