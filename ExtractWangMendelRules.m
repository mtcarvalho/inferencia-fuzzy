    function [fis, rules] = ExtractWangMendelRules( fis, data )

    [mfs, indx]= GetFisMembershipFunctionEvaluations(fis, data);
    indx= prod(indx,2);
    unqInputs= unique(mfs(:, 1:end-1), 'rows');

    rules= [unqInputs, zeros(size(unqInputs,1), 1)];

    for i= 1:size(unqInputs,1)
        dupRules= ismember(mfs(:, 1:end-1), unqInputs(i,:), 'rows');
        [~, bestRule]= max(indx(dupRules));

        possibleOutputs= mfs(dupRules,end);
        rules(i,end)= possibleOutputs(bestRule);
    end
    
    rules= [rules, ones(size(rules,1), 2)];
    fis= addrule(fis, rules);

end