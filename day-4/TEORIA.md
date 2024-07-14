# ReplicaSet

A principal função do ReplicaSet é garantir que as réplcias dos seus Pods estejam na quantidade total que você solicitou.
Os ReplicaSets são criados automaticamente juntos do Deployments, sendo que o Deployment é responsável por gerenciar a saúde das aplicações rodando nos pods,
enquanto os ReplicaSets são subordinados a ele, garantindo a quantidade de pods especificada.
A criação de ReplicaSets avulsas dos Deployments é possível, porém não muito utilizada.

## Ciclo de Vida do ReplicaSet

Conforme ocorrem alterações nos Deployments, são criados novos ReplicaSets para subrir as alterações feitas nas especificações das Pods. Conforme cada atualização é feita, novos ReplicaSets vão sendo criados.
Caso ocorra um Rollback, o Deployment irá referenciar o ReplicaSet antigo e, dessa forma retornando as configurações das Pods pré Rollout.
O ReplicaSet em resumo é subalterno ao Deployment e gerenciado por ele, mas ele quem cuida do estado e quantidade das Pods, sendo o estado orientado pelo Deployment.

# DaemonSets

É um controlador de Pods, assim como o ReplicaSet, porém que trabalha de uma forma diferente do ReplicaSet. 
O DaemonSet é responsável por garantir que pelo menos uma réplica do conjunto estará rodando em cada um dos nós, é um recurso muito bom para utilização de Agents de monitoramento, como Datadog, NewRelic e Prometheus, além de ferramentas de segurança, como Falco, outra usabilidade é para realização de Proxy de Rede em todos os Nodes do Cluster. 
Em resumo, DaemonSets são uma forma de garantir que terá um Pod rodando em cada Node de um Cluster.

# Probes

São as Sondas responsáveis por averiguar que a aplicação deployada no K8S está funcionando corretamente.
Elas verificam os conteineres com diferentes abordagens, são declarativas através do manifesto para que realizem essa verificação constante de saúde da aplicação.
Existem 3 tipos de Probes no K8S, as LivenessProbes que verifica se a App está viva, se ela continua respondendo, as StratUpProbes, que verificam ao iniciar a aplicação, se ela já está disponível para ser utilizada, além disso, a última mas não menos importante são as ReadinessProbes, que verificam se a aplicação já está disponível para receber requisições, com essas 3 Probes é possível garantir a saúde do Pod.

As Probes quando se deparam com cenários de saúde impactada da Pod, conseguiram realizar funções para tentar recuperar a saúde da Pod, como resetá-la, enviar alertas de indisponibilidade etc. É como se fosse um HealthCheck mais sofisticado, tal verificação pode ser feita através de endereços HTTP, conexão TCP, executar um comando, as possibilidades são ilimitadas.

## LivenessProbe

A LivenessProbe é a nossa Probe de verificação de integridade, o que ela faz é verificar se o que está rodando dentro do Pod está saudável. O que fazemos é criar uma forma de testar se o que temos dentro do Pod está respondendo conforme esperado. Se por acaso o teste falhar, o Pod será reiniciado.

## ReadinessProbe

A ReadinessProbe é uma forma de o Kubernetes verificar se o seu container está pronto para receber tráfego, se ele está pronto para receber requisições vindas de fora.

Essa é a nossa probe de leitura, ela fica verificando se o nosso container está pronto para receber requisições, e se estiver pronto, ele irá receber requisições, caso contrário, ele não irá receber requisições, pois será removido do endpoint do serviço, fazendo com que o tráfego não chegue até ele.

## StartUpProbe

A StartUpProbe é a responsável por verificar se o nosso container foi inicializado corretamente, e se ele está pronto para receber requisições.

Ele é muito parecido com a ReadinessProbe, mas a diferença é que a StartUpProbe é executada apenas uma vez no começo da vida do nosso container, e a ReadinessProbe é executada de tempos em tempos.
