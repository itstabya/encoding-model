
for n = 1:180 %for loop for every neuron
    
    % crop all the edge zeros out ("cleaning the data")
    cropped_ball_data = []; % all the ball data here of the first neuron 
    neural_data = []; %corresponding neural data of the ball data

    for i = 1:length(balldata)
        if find(balldata{i}) ~= 0; %if there's ball data (doing this because 112 has no data)
            frames = find(balldata{i}); % cropping out the edge zeros
            s = frames(1); 
            e = frames(end);
            for j = s:e
                cropped_ball_data = [cropped_ball_data, balldata{i}(j)];
                neural_data = [neural_data, neural_act_mat{i}(j, n)]; % n represents the neurons
            end
        end
    end

    bins = cell(84, 1);
    %sorting values into its bin
       for i = 1: length(cropped_ball_data)
           %finding which speed to to insert our neural data
           val = floor(cropped_ball_data(i)) + 45; % adding 45 because indices begin at 1
           %adding that respective neural_data to the bin
           bins{val} = [bins{val}, neural_data(i)]; % val serves as the key
       end
       
    %collapsing each of the bin values into its avg val 
    for i = 1:length(bins)
        if length(bins{i}) > 1; %if val exists
            bins{i} = mean(bins{i}); 
        else % accounting for bins with no values (setting automatically to zero)
            bins{i} = 0;
        end

    end
    bin_array = cell2mat(bins);
    all_bins{n} = bin_array; %add this bin to neuron's data
end
figure(1)
X = -42:41; % 84 range, x-axis showing the balldata speed
all_bin_mat = cell2mat(all_bins);
plot(X, all_bin_mat)
title('Averaged Neural Activity Per Ball Velocity Bin')
xlabel('Velocity')
ylabel('Neural Activity')

figure(2)
for i = 1:180
    scatter(X, all_bins{i})
    hold on 
end

%SCATTER PLOT OF THE SAME AS ABOVE
% means = [];
% stds = [];
% for i = 1:84
%     means = [means, mean(all_bin_mat(i:i, 1:180))];
%     stds = [stds, std(all_bin_mat(i:i, 1:80)) / 2];
% end


%columns: all_bin_mat(1:84, c:c)
%rows: all_bin_mat(r:r, 1:180)

%% work on smoothing the graph out (binning values need to improve)

%just going to be the scatter plot to preserve parts of the data
% this is an immensely slow batch of code (sheer size of the for loop ?)
% around 712 k values 

% bd = []; %bd = ball data
% nd = []; %nd = neuron data
% for n = 1:180 %for loop for every neuron
%     for i = 1:length(balldata) %going through every one of the trials
%         if find(balldata{i}) ~= 0; %if there's ball data (doing this because trial 112 has no data)
%             frames = find(balldata{i}); % cropping out the edge zeros
%             s = frames(1); 
%             e = frames(end);
%             for j = s:e
%                 bd= [bd, balldata{i}(j)];
%                 nd = [nd, neural_act_mat{i}(j, n)]; % n represents the neurons
%             end
%         end
%     end
%     
% end
% 
% figure(2)
% scatter(bd, nd)

