function [x,fval,exitflag,output,lambda] = Q2_linearProg(node)

x1_ub = node(1);
x1_lb = node(2);
x2_ub = node(3);
x2_lb = node(4);

f = [1 5]*-1;
A = [2 -1 
    -1 1
    1 4];
b = [4 1 12];
lb = [x1_lb; x2_lb];
ub = [x1_ub; x2_ub];

options = optimoptions('linprog', 'Algorithm', 'dual-simplex', 'Display', 'off');
[x,fval,exitflag,output,lambda] = linprog(f,A,b,[],[],lb,ub,[],options);
