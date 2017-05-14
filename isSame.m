function y = isSame(v1, v2)
y = 1;
counter = 0;
tempv1 = round(v1,1);
tempv2 = round(v2,1);

result = tempv1 == tempv2

if all(result,1)
   y = 0; 
end
end