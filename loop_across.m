function [array] = loop_across(neural_mat, tn_list, timeframe_list, neuron)
% neural_mat = the raw data
% list = list of trial numbers
% timeframe list = corresponding timeframe
    tfs = 23; %tfs = timeframes
    cell_container = cell(tfs, 1);
    for i = 1:length(tn_list)
        trial_num = tn_list(i);
        start = timeframe_list(trial_num) - 6; %if starting at beginning, start = 0
        for j = 1:length(cell_container)
            cell_container{j} = [cell_container{j}, neural_mat{trial_num}(start + j, neuron)];
        end
    end 
    array = cell2mat(cell_container);
end

