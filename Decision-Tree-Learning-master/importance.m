function ig = importance(data_set)
% takes in a data set and
% returns the information gain of the existing attributes

num_of_attr = size(data_set,2) - 1;
ig = zeros(num_of_attr,1);
p = size(data_set(data_set(:,num_of_attr+1)==1),1);
n = size(data_set(data_set(:,num_of_attr+1)==0),1);
b = entropy(p / (p + n));

% for every attribute in the data_set, compute the information gain
for i = 1 : num_of_attr
    rm = 0;
    [num, labels] = categories(data_set(:,i));
    % for every category in the attribute i compute its part
    % in the remainder of i
    for j = 1 : num
        p_j = 0;
        n_j = 0;
        % compute the number of positive and negative examples
        % for the category j
        for ex = data_set'
            % if the ex example has the value of labels(j) of the attribute i...
            if ex(i) == labels(j)
                % ... check its goal attribute value, and add accordingly
                if ex(end) == 1
                    p_j = p_j + 1;
                else
                    n_j = n_j + 1;
                end
            end    
        end
        % add the current summation term
        rm = rm + (p_j + n_j) / (p + n) * entropy(p_j / (p_j + n_j));
    end
    % compute the information gain
    ig(i) = b - rm;
end

end
