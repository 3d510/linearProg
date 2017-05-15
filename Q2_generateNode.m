function [node1 node2] = Q2_generateNode(x1,x2,curNode) 

node1 = curNode;
node2 = curNode;

if Q2_isInteger(x1) && Q2_isInteger(x2)
    node1 = [];
    node2 = [];
elseif ~Q2_isInteger(x1) % x1 is not integer
    if (ceil(x1) > node1(2))
        node1(2) = ceil(x1);
    end
    if (floor(x1) < node2(1))
        node2(1) = floor(x1);
    end
else
    node1 = [1000 0 ceil(x2) 0 ];
    node2 = [1000 0 1000 floor(x2)];
    
    if (ceil(x2) > node1(4))
        node1(4) = ceil(x2);
    end
    if (floor(x2) < node2(3))
        node2(3) = floor(x2);
    end
end