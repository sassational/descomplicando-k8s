# Ingress no EKS

A título de praticar a utilização do Ingress em um ambiente gerenciado em Nuvem, invés dos testes locais realizados no Kind, optei por subir um cluster no EKS para configuração do Ingress.
No entanto, eu fui viajar, fechei o terminal sem salvar o ".tf" e perdi tudo rsrsrs. 
Logo, como minhas férias já já acabam e quero aproveitar, mas mantendo documentado para consultas posteriores, aqui tem um tutorial "na munheca" usando o EKSCTL.

## Configuração Utilizada

1- Criação de um Cluster na AWS utilizando o EKSCTL (demorou 8 minutos):
```
eksctl create cluster --name=sassational-eks --version=1.24 --region=us-east-1 --nodegroup-name=sassational-eks-nodegroup --node-type=t3.medium --nodes=2 --nodes-min=1 --nodes-max=3 --managed
```

2- Conectar o kubectl no Cluster para fazer as operações de k8s-admin:
```
aws eks update-kubeconfig --region us-east-1 --name sassational-eks
```

2.5- Após o contexto configurado, se você quiser alternar entre múltiplos clusters rapidinho, só usar esse comando:
```
kubectl config use-context <NOME_DO_CLUSTER>
```

3- Instalar o Controller do NGINX no Cluster: 
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.11.1/deploy/static/provider/aws/deploy.yaml
```

3.5- O Ingress NGINX na AWS cria automaticamente (caso seu cluster esteja com as configurações de permissão corretamente configuradas) um Network Load Balancer e, esse NLB quem vai fazer o redirecionamento de acesso via Endpoints no K8S.
![image](https://github.com/user-attachments/assets/ad9ef370-4536-4611-9f76-e6c825b77c20)

## Conclusão

Agora com o Cluster criado "na munheca" (crianças não façam isso em casa, usem sempre IaC e sejam pessoas melhores que eu, salvem os arquivos antes de fechar o terminal e desligar a máquina), você irá aplicar as configurações definidas do Ingress no EKS fazendo toda a configuração de acordo com os .YAMLS presentes nesse repositório.
