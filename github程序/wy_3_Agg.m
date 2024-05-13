function C=wy_3_Agg(A,B)
h=length(A(:,1));
l=length(A(1,:));
for i=1:h
    for j=1:l
        h1=length(B{i,j}(:,1));
     
        for i1=1:h1
            if ismember(B{i,j}(i1,1),A{i,j}(:,1))
                loc=find(A{i,j}(:,1)==B{i,j}(i1,1));
                A{i,j}(loc(1),2)=A{i,j}(loc(1),2)+B{i,j}(i1,2);
            else
            h2=length(A{i,j}(:,1));    
                h2=h2+1;
                A{i,j}(h2,:)=B{i,j}(i1,:);
            end
        end
    end
end
C=A;
end