customers_tbl = readtable('Mall_Customers.csv');

cus_without_income = table2array(customers_tbl(:,[2 3 5]));
cus_income = table2array(customers_tbl(:,4));

% Generate FIS from data
opt = genfisOptions('FCMClustering','FISType','mamdani');
generated_fis = genfis(cus_without_income,cus_income,opt);

showrule(generated_fis)

writeFIS(generated_fis, "generatedFIS");

extracted_fis = generated_fis;
extracted_fis.rule = [];

% Generate FIS from function
[extracted_fis] = ExtractWangMendelRules(extracted_fis, [cus_without_income cus_income]);

showrule(extracted_fis)

writeFIS(extracted_fis, "extractedFIS");

generating_fis = evalfis(cus_without_income, generated_fis);

extracting_fis = evalfis(cus_without_income, extracted_fis);

% Comparison of results
comparison = table(generating_fis, extracting_fis, cus_income);

disp(comparison)

stackedplot(comparison)