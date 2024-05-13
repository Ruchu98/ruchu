function f = fun1(x)

   
     load('mubiao1','mubiao1');
    
    % Get the length of the numeric variable x
    n = length(x);

    % Replace symbolic variables with numeric values
    for i = 1:n
        mubiao = subs(mubiao, sym(['x' num2str(i)]), x(i));
    end

    % Evaluate the symbolic expression to obtain numeric values
    f= double(mubiao); 
end