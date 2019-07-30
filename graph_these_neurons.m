%% given an array of neurons, return the structure needed to plot the mean of the neural activity

% is this the same as loop across

function [cells] = graph_these_neurons(neurons1, neurons2, neural_act_mat, times)
    inter = intersect(neurons1, neurons2);
    cells = cell(1, length(inter));
    for n = 1:length(inter)
        nn = inter(n); % nn = neuron number
        vals = loop_across(neural_act_mat, inter, times, nn);
        cells{n} = mean(vals, 2)
    end
    
    cells = cell2mat(cells);

        