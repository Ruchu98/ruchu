function score=WY_3defenhanshu(A)
[m,n]=size(A);
score_1=0;
for i=1:m
    score_1(i,1)=A(i,1)*A(i,2);
end
score=sum(score_1);
end