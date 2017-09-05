function [c, labels] = categories(attribute)
% takes in examples of an attribute
% and returns the number of different categories in this attribute
% and the labels of these categories

c = 1;
attr = sort(attribute);
current = attr(1);
labels = attr(1);

for k  = 2 : size(attr)
    if current ~= attr(k)
        current = attr(k);
        c = c + 1;
	   labels = [labels; current];
    end
end

end
