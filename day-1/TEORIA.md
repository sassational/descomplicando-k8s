# Oque são Conteineres?

Conteineres, são reservas de recursos realizadas dentro de uma máquina mãe para realização de tarefas. Por reserva de recursos, pode-se entender CPU, Memória, Armazenamento e etc.
No entanto, esse isolamento não se diz somente quanto ao consumo de recursos, mas toda a parte de reds, sistema de arquivos, usuários, armazenamento, enfim, as funcionalidades do sistema nativo qual o conteiner está em execução também estarão isoladas.
Os processos executados dentro de um container e os da máquina mãe não se comunicam, logo, as palavras chaves desse conceito são **Reserva** e **Isolamento**.

## E qual a diferença deles, para Máquinas Virtuais?

As máquinas virtuais são virtualizações de um computador, elas possuem seus prórpios sistemas operacionais e simulação de hardware.
Essa é a principal diferença, ambos podem ser isolados, no entanto, um é um computador dentro de outro computador, enquanto o outro é uma reserva de recursos.

## E como esse isolamento e reserva é feito?

Depende, quando se relaciona ao isolamento e reserva de recursos, o módulo do Kernel responsável é o **CGroup**.
Quando relacionado ao isolamento das funcionalidades do sistema, como usuários, serviços, processos e etc, o módulo do Kernel responsável é o **Namespace**.

## Conteiner Engine

* É o responsável pela criação do conteiner, de exemplo temos o Docker e Podman, ele vai ser responsável por realizar as configurações para criação do conteiner, como ponto de montagem, volumes, redes e etc.
* Detalhe! Ele não conversa diretamente com o Kernel, quem realiza isso é o **Conteiner Runtime**.

## Conteiner Runtime

* É o responsável para colocar o conteiner em execução, ele quem irá se comunicar com o Kernel para que aconteção a reserva e isolamento de recursos na máquina.
* Tem 2 tipos principais de Conteiner Runtime:
    - **Low-Level**: Executados diretamente pelo Kernel, se comunicam diretamente com o Kernel.
    - **High-Level**: Executado por uma conteiner engine.
 
## OCI

Open Container Initiative: É a associação que propôs a padronização e normatização quando se fala de Conteineres. Promovendo o compartilhamento de informação e compatibilidade entre diferentes desenvolvimentos relacionados a conteineres.

---

# Oque é Kubernetes?

Kubernetes é um orquestrador de conteineres, o software responsável por gerenciar múltiplos conteineres em execução ao mesmo tempo.
Por orquestração, entende-se escalabilidade, recursos alocados, armazenamento, balanceamento de carga, comunicação entre conteineres e etc. Como se fosse o responsável para o **funcionamento de todo o ecosistema de conteineres!**

## A origem do Kubernetes
Foi desenvolvido em 2014 dentro da Google com o nome de "Borg" para orquestrar conteineres dentro da Google.
Mais ou menos na mesma época, ocorreu a explosão do Docker, a Google achou isso interessante e abriu a parte do código que se relacionava a Conteineres e, seu nome era Kubernetes.
O Kubernetes é o líder no mercado atualmente com a orquestração de Conteineres, foi escrito em Go e tem total apoio da comunidade e com o desenvolvimento ativo de novidades!

---

# Arquitetura do Kubernetes

Antes de aprofundarmos na utilização do Kubernetes como um todo, vamos aprofundar um pouco em conceitos chave da arquitetura do Kubernetes e como a solução funciona como um todo.

## Cluster

Agregado de máquinas disponíveis para utilização por alguma solução, nesse caso, a solução é o Kubernetes.

## Nodes

Cada máquina em um Cluster do Kubernetes são conhecidas como Nodes, não existindo número mínimo ou máximo, sendo batante atreladas a capacidade de processamento memória disponível e etc.

### Node - Control Plane

São os Nodes principais do Kubernetes, que vão ser responsáveis por controlar e garantir a saúde do Cluster, dentro deles irão existir todos os conteineres necessários para que o Kubernetes funcione corretamente.
É possível hospedar conteineres de aplicações dentro do Control Plane, mas é altamente não recomendado!
A comunicação entre Control Planes e Workers é **realizada constantemente**!

#### Componentes do Control Plane

* **ETCD**:
  - Banco do Cluster, o responsável por guardar todo o estado do Cluster, o cérebro pensante que vai guardar o estado atual do Cluster.
  - Por ser uma parte tão importante, é importante que esse serviço possua várias réplicas, redundância, alta disponibilidade.
  - Se comunica através das **portas 2378 e 2380** através do TCP.
* **Kube API Server**:
  - Único serviço que se comunica com o ETCD.
  - Se comunica com todo o Cluster, seja Control Plane ou Worker, seu objetivo principal é obter o estado de todo Cluster através da centralização de tudo que está ocorrendo no Cluster através dele.
  - Está sempre respondendo através da **porta 6443** através do TCP.
* **Kube Scheduler**:
  - Responsável por, através do conhecimento dos recursos de hardware disponíveis, realizar o agendamento de criação de novos recursos dentro do Cluster, como Pods, Volumes, Services e etc.
  - Se comunica pela **porta 10251** através do TCP.
* **Kube Controller Manager**:
  - O Kubernetes tem vários Controllers, cada um com uma responsabilidade para com o Cluster.
  - O Kube Controller Manager vai ser o responsável por garantir o estado do Cluster, garantindo que tudo esteja funcionando da melhor forma possível.
  - Se comunica pela **porta 10252** através do TCP.
  
### Node - Workers

São os nós de funcionamento das aplicações quais o Kubernetes está hospedando, se você está hospedando um site que irá conter em execução a API de Backend, Bancos de Dados e etc. Todos esses serviços estarão conteinerizados dentro dos Node Workers.
A comunicação entre Control Planes e Workers é **realizada constantemente**!

#### Componentes do Woker

* **Kubelet**:
  - Agente do Kubernetes dentro do nó, que fica verificando se está tudo ok entre os recursos daquele nó, se algo está errado se está faltando algo e etc.
  - Ele verifica essas informações constantemente e fica se comunicando com o Kube API Server.
  - Se comunica pela **porta 10250** através do TCP.
* **Kube Proxy**:
  - É o responsável pela interações de Rede.
  - Ele quem irá fazer a comunicação dos recursos presentes do Worker, como de exemplo as Pods, se comuniquem com o restante do mundo.

### Portas no NodePort e WeaveNet

Caso você utilize serviços que necessitem da comunicação entre Nodes através do NodePort, as portas disponíveis para comunicação são **30000 - 32767**,todas através de TCP.
Já no casos do WeaveNet, as portas utilizadas são **6783 e 6784**, tanto para TCP quanto UDP.
