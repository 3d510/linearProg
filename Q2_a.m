function [x1, x2, z] = Q2_a()

f = [1 5]*-1;
A = [2 -1 
    -1 1
    1 4];
b = [4 1 12];
lb = zeros(2,1);

options = optimoptions('intlinprog', 'Display', 'off');
intcon = [1;
           2];
[x, fval, exitflag, output] = intlinprog(f, intcon, A, b, [], [], lb, [], options);
x1 = x(1); 
x2 = x(2); 
z = -fval;
fprintf('Q2a: x1 = %d, x2 = %d give optimal result z = %d\n', round(x1), x2, z);
