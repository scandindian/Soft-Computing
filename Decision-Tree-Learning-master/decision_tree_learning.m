function decision_tree_learning(examples, depth, attributes, path, parent_examples)

if isempty(examples)
    % return a path with classification the one of the majority
    % of the parent examples
    if sum(parent_examples(:,end)) < ( length(parent_examples) / 2 )
        path = [path; 0 0];
    else
        path = [path; 1 0];
    end
    print_path(path);
    return
end

if all( examples(:,end) ) || ~any( examples(:,end) )
    % return a path with classification the one of any example
    if examples(end,end)
        path = [path; 1 0];
    else
        path = [path; 0 0];
    end
    print_path(path);
    return 
end

if size(examples,2) == 1
    % return a path with classification the one of the majority
    % of the examples
    if sum(examples(:,1)) < ( length(examples) / 2 )
        path = [path; 0 0];
    else
        path = [path; 1 0];
    end
    print_path(path);
    return 
end

ig = importance(examples);
[~, idx] = sort(ig,'descend');
a = idx(1);
fprintf('\nDepth %i:\n=============\n', depth);
fprintf('Information Gains:\n');
fprintf('Attribute %2i:  %f\n', [attributes, ig]');
fprintf('Attribute with the highest I.G.: %i\n\n', attributes(a));

[c, labels] = categories(examples(:,a));

for l = 1 : c
    
    % choose the examples with the value labels(l) for the
    % attribute attributes(a)
    tmp = examples(:,a) == ( labels(l) * ones(length(examples),1) );
    
    % choose all the columns but the one of the attribute attributes(a)
    cols = [1:(a-1) (a+1):size(examples,2)];
    
    % remaining examples
    exs = examples(tmp, cols);
    
    % remaining attributes
    attr = attributes([1:(a-1) (a+1):end]);
    
    % expand
    decision_tree_learning(exs, depth+1, attr, [path; attributes(a) labels(l)], examples);
    
end

end
