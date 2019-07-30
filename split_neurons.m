%% going through all 180 neurons and splitting them based off 

%taking their average values in specific timeframes and splitting into two
%groups based off of that

%plot based on group

%arbitrarily pick an example neuron from each group

%plot the response of each neuron in its single trials

%working with the axx data structures
function [first_cells, second_cells, first_neurons, second_neurons] = split_neurons(data)
    first_neurons = [];
    second_neurons = [];
    
    for n = 1: length(data)
        dpn = data{n}; % dpn = data per neuron
        %stimulus onset is at 6, split into bin of 6:10 and 10:14
        first = 0;
        for f = 6:9
            first = first + dpn(f);
        end
        first = first / 4;

        second = 0;
        for s = 10:13
            second = second + dpn(s);
        end
        second = second / 4;

        if first > second;
            first_neurons = [first_neurons, n];
        else
            second_neurons = [second_neurons, n];
        end
    end

    first_cells = cell(1, length(first_neurons));
    for i = 1:length(first_neurons)
        nn = first_neurons(i); %nn = neuron number
        first_cells{i} = data{nn};
    end

    second_cells = cell(1, length(second_neurons));
    for i = 1:length(second_neurons)
        nn = second_neurons(i) ;
        second_cells{i} = data{nn};
    end
    
    first_cells = cell2mat(first_cells);
    second_cells = cell2mat(second_cells);






