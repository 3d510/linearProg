p1Price = 4;
p3MaxDemand = 2;
delta = 0.01;
[initX,fval,exitflag,output,lambda] = Q1_b(p3MaxDemand, p1Price);

% find beta
beta = p1Price;
while (true)
    beta = beta + delta;
    if beta > 5
        break;
    end
    [x,fval,exitflag,output,lambda] = Q1_b(p3MaxDemand, beta);
    stopped = Q1_isFinished(x, initX);
    if stopped
       break;
    end
end
beta = beta - delta;
 
% find alpha
alpha = p1Price;
while (true)
    alpha = alpha - delta;
    if alpha < 0
        break;
    end
    [x,fval,exitflag,output,lambda] = Q1_b(p3MaxDemand, alpha);
    stopped = Q1_isFinished(x, initX);
    if stopped 
       break;
    end
end
alpha = alpha + delta;

% print result
fprintf('alpha = %f, beta = %f\n', alpha, beta);
