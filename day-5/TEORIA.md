# Cluster K8S

Um Cluster K8S é um conjunto de instâncias necessárias dedicadas exlusivamente para a operação de orquestração de containeres do K8S.
O Cluster, por mais que composto por múltiplas máquinas, opera em unidade, quanto mais máquinas, mas poder de memória e processamento, ou seja, a possibilidade de orquestração de mais containeres.
Quando estamos pensando em um cluster Kubernetes, precisamos lembrar que a principal função do Kubernetes é orquestrar containers. O Kubernetes é um orquestrador de containers, sendo assim quando estamos falando de um cluster Kubernetes, estamos falando de um cluster de orquestradores de containers.

## Tipos de Instância no Cluster

**Control Plane** - O cérebro a parte responsável por gerenciar o Cluster como um todo, realizar toda a administração do K8S, no Control-Plane que se darão os principais componentes da arquitetura do K8S, como API Server, ETCD, Scheduler, Controller etc.

**Worker** - Instância qual o Deployment dos Pods é realizado, é quem faz o trabalho pesado de executar as Apps Deployadas no K8S.
