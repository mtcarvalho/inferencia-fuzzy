function [rulesMf, rulesActIndx] = GetFisMembershipFunctionEvaluations(fis, data)
% Inputs
    rulesMf= zeros(size(data));
    rulesActIndx= zeros(size(data));
    for i= 1:length(fis.input)
        inputs= data(:, i);
        nMfs= length(fis.input(i).mf);
        evaluations= zeros(length(inputs), nMfs);
        for j= 1:nMfs
            cMf= fis.input(i).mf(j);
            evaluations(:, j)= evalmf(inputs, cMf.params, cMf.type);
        end

        [indx, mf]= max(evaluations, [], 2);
        rulesMf(:, i)= mf;
        rulesActIndx(:,i)= indx;
    end

% Outputs
    inputs= data(:, end);
    nMfs= length(fis.output(1).mf);
    evaluations= zeros(length(inputs), nMfs);
    for j= 1:nMfs
        cMf= fis.output(1).mf(j);
        evaluations(:, j)= evalmf(inputs, cMf.params, cMf.type);
    end

    [indx, mf]= max(evaluations, [], 2);
    rulesMf(:, end)= mf;
    rulesActIndx(:,end)= indx;

end