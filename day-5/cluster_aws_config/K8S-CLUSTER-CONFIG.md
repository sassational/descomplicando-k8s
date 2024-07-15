# Configuração Inicial do Cluster do K8S

Após a aplicação do Cluster na Nuvem através da IaC, basta acessar as instâncias via SSH e configurá-las para instalação do K8S.

## Desativando o uso do Swap no Sistema

Primeiro, vamos desativar a utilização de swap no sistema. Isso é necessário porque o Kubernetes não trabalha bem com swap ativado:
```
sudo swapoff -a
```

## Carregando Módulos do K8S

Agora, vamos carregar os módulos do kernel necessários para o funcionamento do Kubernetes:
```
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter
```
## Configurando os Parâmetros do Sistema

Em seguida, vamos configurar alguns parâmetros do sistema. Isso garantirá que nosso cluster funcione corretamente:
```
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
sudo sysctl --system
```

## Instalando os Pacotes de Kubernetes

Hora de instalar os pacotes do Kubernetes! Coisa linda de ai meu Deus! Aqui vamos nós:
```
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

# Habilitando o Container Runtime através do ConteinerD

Para proporcionar que o K8S consiga agir como orquestrador de containeres, precisamos configurar um container runtime, o utilizado é o ContainerD.

## Instalando ContainerD

Em seguida, vamos instalar o containerd, que são essenciais para nosso ambiente Kubernetes:
```
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install -y containerd.io
```

## Configurando o ContainerD

Agora, vamos configurar o containerd para que ele funcione adequadamente com o nosso cluster:
```
sudo containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl status containerd
```

## Habilitando o Kubelet

Por fim, vamos habilitar o serviço do kubelet para que ele inicie automaticamente com o sistema:
```
sudo systemctl enable --now kubelet
```

## Inicializando o Cluster

Agora que temos tudo configurado, vamos iniciar o nosso cluster:
```
sudo kubeadm init --pod-network-cidr=10.10.0.0/16 --apiserver-advertise-address=<O IP QUE VAI FALAR COM OS NODES OU SEJA, DO CONTROL PLANE>
```

Após a execução bem-sucedida do comando acima, você verá uma mensagem informando que o cluster foi inicializado com sucesso. 
Além disso, você verá um comando para configurar o acesso ao cluster com o kubectl. Copie e cole esse comando em seu terminal:
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## Adicionando os Workers ao Cluster

Para isso, vamos novamente utilizar o comando kubeadm, porém ao invés de executar o comando no node do control plane, nesse momento precisamos rodar o comando diretamente no node que queremos adicionar ao cluster.
Quando inicializamos o nosso cluster, o kubeadm nos mostrou o comando que precisamos executar no novos nodes, para que eles possam ser adicinados ao cluster como workers.
```
sudo kubeadm join <IP DO CONTROL PLANE>:6443 --token <TOKEN DE AUTENTICAÇÃO DO CONTROL-PLANE> \
	--discovery-token-ca-cert-hash <HASH DO CERTIFICADO DE AUTORIDADE DE CERTIFICAÇÃO>
```

Ao executar este comando no worker, ele iniciará o processo de adesão ao cluster. Se o token for válido e o hash do certificado CA corresponder ao certificado CA do nó do control plane, o nó worker será autenticado e adicionado ao cluster. 
Após a adesão bem-sucedida, o novo node começará a executar os Pods e a receber instruções do control plane, conforme necessário.

## Configurando a Pod Network

O K8S ao ser instalado resolve diversos problema para você, porém um problema que ele não resolve é a PodNetwork, a rede que possibilitará que os Nodes se comuniquem.
Para gerir uma Pod Network de forma simples irémos utilizar o WeaveNet:
```
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
```

Após a execução desse comando e configuração da PodNetwork através do WeaveNet, seu Cluster estará funcional!

# Explicando um Pouquinho o CNI

CNI é uma especificação e conjunto de bibliotecas para a configuração de interfaces de rede em containers. A CNI permite que diferentes soluções de rede sejam integradas ao Kubernetes, facilitando a comunicação entre os Pods (grupos de containers) e serviços.

Com isso, temos diferentes plugins de redes, que seguem a especificação CNI, e que podem ser utilizados no Kubernetes. O Weave Net é um desses plugins de rede.
