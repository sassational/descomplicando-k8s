# Pods

São as menores unidades no Kubernetes, a menor parte que será interagida no Kubernetes. Pods não são conteineres, uma vez que uma Pod pode possuir mais de um conteiner.
Portanto, a Pod pode ser considerada um agrupamento de conteineres que compartilham da mesma Network (localhost) e Namespaces.
A prática de Pods com múltiplos conteineres tem se tornado cada vez mais comum, um exemplo é a utilização do IST.IO para monitoramento do conteiner.

## Importante! 

Ao deployar uma aplicação em um Pod que utilize múltiplos conteineres, todos os conteineres associados a um mesmo Pod, estarão em um mesmo Node, não existe separação de conteúdo de Pods dentre diferentes Nodes.
Mas então, uma Pod deve executar todos os recursos de uma aplicação? O Front, Back, Banco de Dados e etc? Não! Pois caso ocorra algum problema com a Pod, sua apliação inteira irá cair, o recomendável é que serviços auxiliares, como conteineres de aplicação e de sidecar, de exemplo, estejam juntos na mesma Pod.

## Comunicação Intra e Inter Pods

* A comunicação entre dois conteineres dentro de uma Pod se dá através do endereçamento de rede local, ou **localhost**.
* A comunicação entre duas Pods distintas se dá através do endereçamento de IP.
* O **HostIP** presente nas Pods, se refere ao IP do Node qual a Pod está hospedada no Cluster.
* O **PodIP** presente nas Pods, se refere ao IP da Pod dentro do Cluster.
