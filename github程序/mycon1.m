function [g, ceq] = mycon1(x)
    % Load symbolic data
    load('symbol_data1.mat', 'as1');
    
    % Get the length of the numeric variable x
    n = length(x);

    % Replace symbolic variables with numeric values
    for i = 1:n
        as1 = subs(as1, sym(['x' num2str(i)]), x(i));
    end

    % Evaluate the symbolic expression to obtain numeric values
    g = double(as1); % Convert to double
    ceq = [];
end