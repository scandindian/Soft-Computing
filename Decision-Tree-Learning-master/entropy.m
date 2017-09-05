function b = entropy(q)
% takes in the probability of the positive examples of a boolean goal
% attribute and returns its entropy 

if q == 0 || q == 1
	b = 0;
else
	b = - q * log2(q) - (1 - q) * log2(1 - q);
end

end
