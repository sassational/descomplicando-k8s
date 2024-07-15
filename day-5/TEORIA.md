# Cluster K8S

Um Cluster K8S é um conjunto de instâncias necessárias dedicadas exlusivamente para a operação de orquestração de containeres do K8S.
O Cluster, por mais que composto por múltiplas máquinas, opera em unidade, quanto mais máquinas, mas poder de memória e processamento, ou seja, a possibilidade de orquestração de mais containeres.

Quando estamos pensando em um cluster Kubernetes, precisamos lembrar que a principal função do Kubernetes é orquestrar containers. O Kubernetes é um orquestrador de containers, sendo assim quando estamos falando de um cluster Kubernetes, estamos falando de um cluster de orquestradores de containers.

## Tipos de Instância no Cluster

**Control Plane** - O cérebro a parte responsável por gerenciar o Cluster como um todo, realizar toda a administração do K8S, no Control-Plane que se darão os principais componentes da arquitetura do K8S, como API Server, ETCD, Scheduler, Controller etc.

**Worker** - Instância qual o Deployment dos Pods é realizado, é quem faz o trabalho pesado de executar as Apps Deployadas no K8S.

## Tipos de Cluster

**Clusters Gerenciados** - Clusters quais o provedor da nuvem faz o gerenciamento do Cluster do K8S para você, ou seja, você consegue se conectar e utilizar o Cluster, mas a configuração e Control Plane é toda administrada pelo provedor, como EKS e GKE.

**Clusters Baremetal** - Clusters quais você realiza a configuração dos componentes do Cluster, as máquinas, muitas vezes físicas de um Datacenter, toda a administração do Control Plane e configuração de novos Nodes será de sua responsabilidade.

## Formas de Instalar o K8S

**Kubeadm**: É uma ferramenta para criar e gerenciar um cluster Kubernetes em vários nós. Ele automatiza muitas das tarefas de configuração do cluster, incluindo a instalação do control plane e dos nodes. É altamente configurável e pode ser usado para criar clusters personalizados.

**Kubespray**: É uma ferramenta que usa o Ansible para implantar e gerenciar um cluster Kubernetes em vários nós. Ele oferece muitas opções para personalizar a instalação do cluster, incluindo a escolha do provedor de rede, o número de réplicas do control plane, o tipo de armazenamento e muito mais. É uma boa opção para implantar um cluster em vários ambientes, incluindo nuvens públicas e privadas.

**Cloud Providers**: Muitos provedores de nuvem, como AWS, Google Cloud Platform e Microsoft Azure, oferecem opções para implantar um cluster Kubernetes em sua infraestrutura. Eles geralmente fornecem modelos predefinidos que podem ser usados para implantar um cluster com apenas alguns cliques. Alguns provedores de nuvem também oferecem serviços gerenciados de Kubernetes que lidam com toda a configuração e gerenciamento do cluster.

**Kubernetes Gerenciados**: São serviços gerenciados oferecidos por alguns provedores de nuvem, como Amazon EKS, o GKE do Google Cloud e o AKS, da Azure. Eles oferecem um cluster Kubernetes gerenciado onde você só precisa se preocupar em implantar e gerenciar seus aplicativos. Esses serviços lidam com a configuração, atualização e manutenção do cluster para você. Nesse caso, você não tem que gerenciar o control plane do cluster, pois ele é gerenciado pelo provedor de nuvem.

**Kops**: É uma ferramenta para implantar e gerenciar clusters Kubernetes na nuvem. Ele foi projetado especificamente para implantação em nuvens públicas como AWS, GCP e Azure. Kops permite criar, atualizar e gerenciar clusters Kubernetes na nuvem. Algumas das principais vantagens do uso do Kops são a personalização, escalabilidade e segurança. No entanto, o uso do Kops pode ser mais complexo do que outras opções de instalação do Kubernetes, especialmente se você não estiver familiarizado com a nuvem em que está implantando.

**Minikube e Kind**: São ferramentas que permitem criar um cluster Kubernetes localmente, em um único nó. São úteis para testar e aprender sobre o Kubernetes, pois você pode criar um cluster em poucos minutos e começar a implantar aplicativos imediatamente. Elas também são úteis para pessoas desenvolvedoras que precisam testar suas aplicações em um ambiente Kubernetes sem precisar configurar um cluster em um ambiente de produção.
