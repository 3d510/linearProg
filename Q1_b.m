function [x,fval,exitflag,output,lambda] = Q1_b(p3MaxDemand, p1Price)

f = [p1Price 3 2 2 1]*-1;
A = [2 0 0 0 0 
     0 2 2 2 1
     0.2 1 0 0.5 0
     1 0 0 0 0
     0 0 1 0 0
     1 1 1 0 0
     0 0 0 1 1]
b = [36 216 18 16 p3MaxDemand 34 28];
lb = zeros(5,1);
%options = optimoptions('linprog', 'Algorithm', 'interior-point', 'Display', 'iter');
%options = optimoptions('linprog', 'Algorithm', 'interior-point', 'Display', 'off');
%options = optimoptions('linprog', 'Algorithm', 'dual-simplex', 'Display', 'iter');
%options = optimoptions('linprog', 'Algorithm', 'dual-simplex', 'Display', 'off');
[x,fval,exitflag,output,lambda] = linprog(f, A, b, [], [], lb)

