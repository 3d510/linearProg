function y = isSame(v1, v2)
y = 1;
for i = 1:length(v1)
    if v1(i) ~= v2(i)
        y = 0;
    end
end
end