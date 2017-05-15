function y = Q1_isFinished(v1, v2)
y = true;
tempv1 = round(v1,1);
tempv2 = round(v2,1);

result = tempv1 == tempv2;

if all(result,1)
   y = false; 
end
end