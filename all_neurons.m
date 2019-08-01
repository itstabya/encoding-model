
aleft = cell(1, 180);
aright = cell(1, 180);
aone = cell(1, 180);
atwo = cell(1, 180);
athree = cell(1, 180);
afour = cell(1, 180);
areward = cell(1, 180);
acue = cell(1, 180);
apr = cell(1, 180);% all previously right
apw = cell(1, 180); % all previously wrong

for k = 1:180 
    %% cue
    cue_array = loop_across(neural_act_mat, 1:173, bopt, k);
    
    %% difficulty levels
    one_array = loop_across(neural_act_mat, t1, sopt, k);
    two_array = loop_across(neural_act_mat, t2, sopt, k);
    three_array = loop_across(neural_act_mat, t3, sopt, k);
    four_array = loop_across(neural_act_mat, t4, sopt, k);
    
    %% choices 
    prev_right_array = loop_across(neural_act_mat, prt, bopt, k);
    prev_wrong_array = loop_across(neural_act_mat, pwt, bopt, k);
    reward_array = loop_across(neural_act_mat, rt, ropt, k);
    correct_array = loop_across(neural_act_mat, ct, sopt, k);
    incorrect_array = loop_across(neural_act_mat, wt, sopt, k);
    
    %% for left and right stimulus
    left_array = loop_across(neural_act_mat, lst, sopt, k); 
    right_array = loop_across(neural_act_mat, rst, sopt, k);

    %% taking the mean value for all the trials into each neuron
    aleft{k} = mean(left_array, 2);
    aright{k} = mean(right_array, 2);
    aone{k} = mean(one_array, 2);
    atwo{k} = mean(two_array, 2);
    athree{k} = mean(three_array, 2);
    afour{k} = mean(four_array, 2);
    areward{k} = mean(reward_array, 2);
    awrong{k} = mean(incorrect_array, 2);
    acue{k} = mean(cue_array, 2);
    apr{k} = mean(prev_right_array, 2);
    apw{k} = mean(prev_wrong_array, 2);
    
end
%% converting into matrices
all_left = cell2mat(aleft);
all_right = cell2mat(aright);
all_one = cell2mat(aone);
all_two = cell2mat(atwo);
all_three = cell2mat(athree);
all_four = cell2mat(afour);
all_reward = cell2mat(areward);
all_wrong = cell2mat(awrong);
all_cue = cell2mat(acue);
all_pr = cell2mat(apr); %ASSUMING that you coded for 
all_pw = cell2mat(apw);

%we can now apply plot() or imagesc()

%% going through and finding peak information
[lp, lp_x, lp_y]  = find_peaks(all_left); 
%lp = left peaks (cell of cells // we're looking at per neuron)
%lp_x = array of all x values
%lp_y = array of all corresponding y values
[rp, rp_x, rp_y] = find_peaks(all_right);
[op, op_x, op_y] = find_peaks(all_one);
[twp, twp_x, twp_y] = find_peaks(all_two);
[thp, thp_x, thp_y] = find_peaks(all_three);
[fp, fp_x, fp_y] = find_peaks(all_four);
[rp, rp_x, rp_y] = find_peaks(all_reward);
[cp, cp_x, cp_y] = find_peaks(all_cue);
[prp, prp_x, prp_y] = find_peaks(all_pr);
[pwp, pwp_x, pwp_y] = find_peaks(all_pw);
 % can use sum(op_x(:) = val) to calculate how many points are in each

 %% working off of the bimodal distribution
 [l1, l2, l1n, l2n] = split_neurons(aleft);
 [r1, r2, r1n, r2n] = split_neurons(aright);
 [o1, o2, o1n, o2n] = split_neurons(aone);
 [tw1, tw2, tw1n, tw2n] = split_neurons(atwo);
 [th1, th2, th1n, th2n] = split_neurons(athree);
 [f1, f2, f1n, f2n] = split_neurons(afour);
 [rew1, rew2, rew1n, rew2n] = split_neurons(areward);
 [w1, w2, w1n, w2n] = split_neurons(awrong);
 [c1, c2, c1n, c2n] = split_neurons(acue);
 [pr1, pr2, pr1n, pr2n] = split_neurons(apr);
 [pw1, pw2, pw1n, pw2n] = split_neurons(apw);

 %% finding if any neurons move from the first peak to the second peak
 % with the different left right stimulus
%  l1r2_neurons = graph_these_neurons(l1n, r2n, neural_act_mat, stim_onset_per_trial);
%  l2r1_neurons = graph_these_neurons(l2n, r1n, neural_act_mat, stim_onset_per_trial);
 