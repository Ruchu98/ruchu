function B=wy_3_AP(A,T)
alt=length(A(:,1));
cri=length(A(1,:));
for i=1:alt
    for j=1:cri
        B{i,j}(:,1)=A{i,j}(:,1);
        B{i,j}(:,2)=A{i,j}(:,2)./T;
    end
end

end