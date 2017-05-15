node_counter = 1;

% nodes not yet executed, store (x1_ub, x1_lb, x2_ub, x2_lb, node_number)
queue = [];

% initialize upperbound and lowerbound
[x1, x2, lowerbound] = Q2_b();
[x,upperbound,exitflag,output,lambda] = Q2_linearProg([1000, 0, 1000, 0]);
upperbound = -upperbound;

% store optimal solution for nodes, node_number and node_parent
% used to contruct the tree 
% each row of node_result: (x1_best, x2_best, z, node_number,parent_number)
node_result = [x(1) x(2) upperbound 1 -1]; 

% add initial node to the queue
[node1, node2] = Q2_generateNode(x(1), x(2), [1000 0 1000 0]);
queue = [node1 2 1]; % node_number = 2, parent = 1
queue = [queue; [node2 3 1]]; % similarly
node_counter = 4;

while true
    % pop top of the queue
    [row,col] = size(queue);
    if (row == 0) 
        break;
    end
    node = queue(1,:);
    if (row == 1)
        queue = [];
    else
        queue = queue(2:end,:);
    end
    % implement branching
    [x,fval,exitflag,output,lambda] = Q2_linearProg(node);
    fval = -fval;
    if isempty(x)
        node_result = [node_result; [-1 -1 -1 node(5) node(6)]];
        continue; % terminate this branch because of infeasible solution
    else
        node_result = [node_result; [x(1) x(2) fval node(5) node(6)]];
    end
    [node1, node2] = Q2_generateNode(x(1), x(2), node);
    if isempty(node1) && isempty(node2) % integer solution for x
        lowerbound = fval;
        if (lowerbound >= upperbound)
            break;
        end
        continue; % terminate this branch because of integer solution
    else
        upperbound = fval;
        % add more nodes to the queue
        queue = [queue; [node1, node_counter, node(5)]];
        queue = [queue; [node2, node_counter + 1, node(5)]];
        node_counter = node_counter + 2;
    end 
end

fprintf('Q2c: x1 = %d, x2 = %d give optimal result z = %d\n', x(1), x(2), fval);


