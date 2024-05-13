function score=wangyu_1defenhanshu(A)
[m,n]=size(A);
score_1=0;
for i=1:m
    score_1=score_1+A(i,1)*A(i,2);
end
score=score_1/(sum(A(:,2)));