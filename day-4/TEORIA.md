# ReplicaSet

A principal função do ReplicaSet é garantir que as réplcias dos seus Pods estejam na quantidade total que você solicitou.
Os ReplicaSets são criados automaticamente juntos do Deployments, sendo que o Deployment é responsável por gerenciar a saúde das aplicações rodando nos pods,
enquanto os ReplicaSets são subordinados a ele, garantindo a quantidade de pods especificada.
A criação de ReplicaSets avulsas dos Deployments é possível, porém não muito utilizada.

## Ciclo de Vida do ReplicaSet

Conforme ocorrem alterações nos Deployments, são criados novos ReplicaSets para subrir as alterações feitas nas especificações das Pods. Conforme cada atualização é feita, novos ReplicaSets vão sendo criados.
Caso ocorra um Rollback, o Deployment irá referenciar o ReplicaSet antigo e, dessa forma retornando as configurações das Pods pré Rollout.
O ReplicaSet em resumo é subalterno ao Deployment e gerenciado por ele, mas ele quem cuida do estado e quantidade das Pods, sendo o estado orientado pelo Deployment.
