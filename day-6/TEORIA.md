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
