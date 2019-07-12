# Inferência da Renda Anual de Clientes de um Shopping

Este é um trabalho realizado para a disciplina Lógica Fuzzy do Curso de Especialização BI Master, da PUC-Rio, cujo objetivo é realizar inferências da renda anual de clientes de um shopping utilizando - e comparando - duas abordagens no ``MatLab``. O detalhamento desse trabalho está presente no arquivo ``Inferência da Renda Anual de Clientes de um Shopping.pdf``.

Detalhes sobre os arquivos:

- ``Mall_Customers.csv`` é o arquivo que contém os dados a serem utilizados na inferência.
- ``*.fis`` todos os arquivos com extensão ``fis`` são ``Sistemas de Infência Fuzzy``, gerados pelo código ``MatLab``.
- ``normalize_gender.rmp`` é um processo do ``RapidMiner`` que realiza a transformação dos dados, que serão consumidos pelo ``MatLab``.
- ``*.m`` são arquivos ``MatLab`` que contém o código que realiza a inferência. O ``InferNormalizeScore.m`` realiza a inferência normalizando os dados de entrada, e o ``InferScore.m``realiza a inferência sem normalizar os dados, o que impacta no resultado final, como detalhado no ``pdf``.