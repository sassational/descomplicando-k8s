# Deployments

É a metodologia correta para "deployar" uma aplicação no Kubernetes, o Deployment vai garantir a alta disponibilidade das Pods da sua aplicação.
Ao utilizar o Deployment, é possível criar réplicas da sua aplicação, garantindo assim a alta disponibilidade previamente citada, logo, se ocorrer qualquer problema 
com a Pod, ou o Node que ela está hospedada, não será necessário preocupação alguma, pois já terá uma réplica em execução no mesmo instante. Além disso,
se por qualquer motivo uma réplica parar de funcionar, o Deployment vai garantir que outra réplica idêntica suba, para cumprir as definições de quantidade de réplicas rodando.

## Importante!

Ao criar um Deployment, sempre será criado um ReplicaSet, mas não se preocupe, as informações referentes ao ReplicaSet serão informadas no **day-4**. 
No momento, é necessário lembrar que o ReplicaSet é oque garante que todas as réplicas estejam funcionando e, caso dê algum problema, que novas sejam disponibilizadas.

## Finalidade do Deployment e Estratégias de Inicialização

Como foi dito, e repetido anteriormente, o Deployment é essencial para garantir a alta disponibilidade da aplicação. Mas, além disso, outra finalidade desse recurso é,
a possibilidade de utilizar de "metodologias de deploy", para ao realizar atualizações na aplicação, tais alterações sejam disponibilizadas de forma segura e, sem downtime.
Outro recurso essencial são, as "metodologias de rollback", que possibilitam retornar para alguma versão antiga da aplicação de forma rápida, caso ao realizar o processo de
atualização, a nova versão está apresentando erros.
