function [x1, x2, z] = Q2_b()
% solve relaxed linear programming problem

f = [1 5]*-1;
A = [2 -1 
    -1 1
    1 4];
b = [4 1 12];
lb = zeros(2,1);
       
options = optimoptions('linprog', 'Algorithm', 'dual-simplex', 'Display', 'off');
[x,fval,exitflag,output,lambda] = linprog(f, A, b, [], [], lb,[], [], options);

% we can round each number in x up or down, giving 4 combinations
round_test = [floor(x(1)) floor(x(2)) 
              floor(x(1)) ceil(x(2))
              ceil(x(1)) floor(x(2))
              ceil(x(1)) ceil(x(2))];
z = -1;
x_best = -1;
y_best = -1;
for i = 1:4
    x1 = round_test(i,1);
    x2 = round_test(i,2);
    % check if those values satisfy all constraints
    valid = 1;
    for j = 1:3
        if A(j,1) * x1 + A(j,2) *x2 > b(j)
            valid = 0;
        end
    end
    if valid == 0
        continue;
    end
    eval = -(x1 * f(1) + x2 * f(2));
    if (eval > z) 
        z = eval;
        x_best = x1;
        y_best = x2;
    end
end

fprintf('Q2b: x1 = %d, x2 = %d give best result z = %d\n', x_best, y_best, z);

