function lab05()
% executes the exercise

data_set = load('HAISS2011.txt');
decision_tree_learning(data_set, 0, (1:(size(data_set,2)-1))', [], data_set);

end
