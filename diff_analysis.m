%% Analyzing how the rewards impact neural activity in our four difficulty levels

%doing this by looking at trials that only pertain to a particular
%difficulty level and correct trials
%% Level One
c1 = intersect(t1, rt); %c1 = correct level ones
ic1 = intersect(t1, wt); 

%% Level Two
c2 = intersect(t2, rt);
ic2 = intersect(t2, wt);

%% Level Three
c3 = intersect(t3, rt);
ic3 = intersect(t3, wt);

%% Level Four
c4 = intersect(t4, rt);
ic4 = intersect(t4, wt);

%% 
ac1 = cell(1, 180);
aic1 = cell(1, 180);
ac2 = cell(1, 180);
aic2 = cell(1, 180);
ac3 = cell(1, 180);
aic3 = cell(1, 180);
ac4 = cell(1, 180);
aic4 = cell(1, 180);

for k = 1:180 
    c1_array = loop_across(neural_act_mat, c1, sopt, k);
    ic1_array = loop_across(neural_act_mat, ic1, sopt, k);
    c2_array = loop_across(neural_act_mat, c2, sopt, k);
    ic2_array = loop_across(neural_act_mat, ic2, sopt, k);
    c3_array = loop_across(neural_act_mat, c3, sopt, k);
    ic3_array = loop_across(neural_act_mat, ic3, sopt, k);
    c4_array = loop_across(neural_act_mat, c4, sopt, k);
    ic4_array = loop_across(neural_act_mat, ic4, sopt, k);
    
    ac1{k} = mean(c1_array, 2);
    aic1{k} = mean(ic1_array, 2);
    ac2{k} = mean(c2_array, 2);
    aic2{k} = mean(ic2_array, 2);
    ac3{k} = mean(c3_array, 2);
    aic3{k} = mean(ic3_array, 2);
    ac4{k} = mean(c4_array, 2);
    aic4{k} = mean(ic4_array, 2);
end

    all_c1 = cell2mat(ac1); 
    all_ic1 = cell2mat(aic1);
    all_c2 = cell2mat(ac2);
    all_ic2 = cell2mat(aic2);
    all_c3 = cell2mat(ac3);
    all_ic3 = cell2mat(aic3);
    all_c4 = cell2mat(ac4);
    all_ic4 = cell2mat(aic4);
    
    % FOCUS SPECIFICALLY ON NEURONS
%    [o1, o2, o1n, o2n] = split_neurons(aone);
%  [tw1, tw2, tw1n, tw2n] = split_neurons(atwo);
%  [th1, th2, th1n, th2n] = split_neurons(athree);
%  [f1, f2, f1n, f2n] = split_neurons(afour);