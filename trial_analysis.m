%% TRIAL ANALYSIS
lst = []; %lst = left stimulus trials
rst = []; %rst = right stimulus trials
ct = []; %ct = correct trials
rt = []; %rt = rewarded trails (same as ct)
wt = []; %it = wrong trials
prt = []; %prt = previously right trials
pwt = []; %pwt = previously wrong trials
t1 = []; %t1 = difficulty level one trials (hardest)
t2 = []; %t2 = difficulty level two trials
t3 = []; %t3 = difficulty level three trials
t4 = []; %t4 = difficulty level four trials (easiest)

sopt = []; %sopt = stimulus onset per trial
ropt = cell(173, 1); %ropt = reward onset per trial
bopt = (zeros(173, 1) + 6)'; % a 173 x 1 matrix of all 6 values (to work with our looping across function)

for t = 1:length(neural_act_mat) %for each trial
        % tracking left and right trials
        if find(left_onsetCells{t})
            mid = find(left_onsetCells{t});
            lst = [lst, t];
        elseif find(right_onsetCells{t})
            mid = find(right_onsetCells{t});
            rst = [rst, t];
        end
        
        %finding when the stimulus occurs
        sopt = [sopt, mid];
        
        % tracking correct and incorrect trials 
        % also tracking previously incorrect/wrong
            % based off of reward
           if any(rewardsCell{t})
               ct = [ct, t];
               rt = [rt, t];
               if t ~= 173;
                   prt = [prt, t];
               end
           else
               wt = [wt, t];
               if t ~= 173;
                   pwt = [pwt, t];
               end
           end
           
        % determining level of difficulty
        contrast = difficultyGood(t);
        if contrast == 0.3200
            t1 = [t1, t];
        elseif contrast == 0.5600
            t2 = [t2, t];
        elseif contrast == 0.6000
            t3 = [t3, t];
        elseif contrast == 0.6400
            t4 = [t4, t];
        end
end

for i = 1:length(rt)
    tn = rt(i);
    ropt{tn} = find(rewardsCell{tn});
end

for i = 1:length(ropt)
    if length(ropt{i}) == 0; %will be true if empty
        ropt{i} = 0;
    end
end

ropt = cell2mat(ropt);

        
    