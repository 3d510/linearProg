p1Price = 4;
p3MaxDemand = 2;
prev_profit = -1;
relation = [];
shadow_prices_III = [];

while (true)
    [x,fval,exitflag,output,lambda] = Q1_b(p3MaxDemand, p1Price);
    profit = -fval;
    shadow_price_III = lambda.ineqlin(5)
    if (profit == prev_profit)
        break;
    end
    shadow_prices_III = [shadow_prices_III shadow_price_III];
    new_relation = [p3MaxDemand profit];
    relation = [relation; new_relation];
    prev_profit = profit;
    p3MaxDemand = p3MaxDemand + 0.6; 
end
 
disp(shadow_prices_III)
plot(relation(:,1), relation(:,2));