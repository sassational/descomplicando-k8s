# Volumes

Sempre que temos uma Pod em execução no K8S, todo dado que é gerado naquela Pod, ao ser removida, são removidos juntos, logo os Volumes existem para reter dados produzidos pelas Pods do K8S.
Existem diversos tipos de volumes, como os **Empty Dirs** que são Volumes efêmeros que os dados são perdidos junto com a deleção da Pod, mas além deles, existem os **Persistent Volumes** que são Volumes que irão persistir os dados, independente do status da Pod.

Para compreender os Volumes, três fatores são os principais de serem entendidos:

- **Persistent Volumes**

- **Storage Class**

- **Persistent Volume Claim**

## Storage Class

Uma StorageClass no Kubernetes é um objeto que descreve e define diferentes classes de armazenamento disponíveis no cluster. Essas classes de armazenamento podem ser usadas para provisionar dinamicamente PersistentVolumes (PVs) de acordo com os requisitos dos PersistentVolumeClaims (PVCs) criados pelos usuários.

A StorageClass é útil para gerenciar e organizar diferentes tipos de armazenamento, como armazenamento em disco rápido e caro ou armazenamento em disco mais lento e barato. Além disso, a StorageClass pode ser usada para definir diferentes políticas de retenção, provisionamento e outras características de armazenamento específicas.

Os administradores do cluster podem criar e gerenciar várias StorageClasses para permitir que os usuários finais escolham a classe de armazenamento adequada para suas necessidades.

Cada StorageClass é definida com um provisionador, que é responsável por criar PersistentVolumes dinamicamente conforme necessário. Os provisionadores podem ser internos (fornecidos pelo próprio Kubernetes) ou externos (fornecidos por provedores de armazenamento específicos).

Inclusive os provisionadores podem ser diferentes para cada provedor de nuvem ou onde o Kubernetes está sendo executado. Vou listar alguns provisionadores que são usados e seus respectivos provedores:

- **kubernetes.io/aws-ebs**: AWS Elastic Block Store (EBS)
- **kubernetes.io/azure-disk**: Azure Disk
- **kubernetes.io/gce-pd**: Google Compute Engine (GCE) Persistent Disk
- **kubernetes.io/cinder**: OpenStack Cinder
- **kubernetes.io/vsphere-volume**: vSphere
- **kubernetes.io/no-provisioner**: Volumes locais
- **kubernetes.io/host-path**: Volumes locais

## PV - Persistent Volumes

O PV é um objeto que representa um recurso de armazenamento físico em um cluster Kubernetes. Ele pode ser um disco rígido em um nó do cluster, um dispositivo de armazenamento em rede (NAS) ou mesmo um serviço de armazenamento em nuvem, como o AWS EBS ou Google Cloud Persistent Disk.

O PV é utilizado para fornecer armazenamento durável, ou seja, os dados armazenados no PV permanecem disponíveis mesmo quando o container é reiniciado ou movido para outro nó.

No Kubernetes, você pode usar várias soluções de armazenamento como Persistent Volumes (PVs). Essas soluções podem ser divididas em dois tipos: armazenamento local e armazenamento em rede. Vou te dar exemplos de algumas opções populares de cada tipo:

Armazenamento local:

- **HostPath**: É uma maneira simples de usar um diretório do nó do cluster como armazenamento. É útil principalmente para testes e desenvolvimento, pois não é apropriado para ambientes de produção, já que os dados armazenados só estão disponíveis no nó específico.

Armazenamento em rede:

- **NFS (Network File System)**: É um sistema de arquivos de rede que permite compartilhar arquivos entre várias máquinas na rede. É uma opção comum para armazenamento compartilhado em um cluster Kubernetes.

- **iSCSI (Internet Small Computer System Interface)**: É um protocolo que permite a conexão de dispositivos de armazenamento de blocos, como SAN (Storage Area Network), por meio de redes IP. Pode ser usado como um PV no Kubernetes.

- **Ceph RBD (RADOS Block Device)**: É uma solução de armazenamento distribuído e altamente escalável que oferece suporte ao armazenamento em bloco, objeto e arquivo. Com o RBD, você pode criar volumes de blocos virtualizados que podem ser montados como PVs no Kubernetes.

- **GlusterFS**: É um sistema de arquivos distribuído e escalável que permite criar volumes de armazenamento compartilhado em vários nós do cluster. Pode ser usado como um PV no Kubernetes.

- **Serviços de Armazenamento em Nuvem**: Fornecedores de nuvem como AWS, Google Cloud e Microsoft Azure oferecem soluções de armazenamento que podem ser integradas ao Kubernetes. Exemplos incluem AWS Elastic Block Store (EBS), Google Cloud Persistent Disk e Azure Disk Storage.
