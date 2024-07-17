# Volumes

Sempre que temos uma Pod em execução no K8S, todo dado que é gerado naquela Pod, ao ser removida, são removidos juntos, logo os Volumes existem para reter dados produzidos pelas Pods do K8S.
Existem diversos tipos de volumes, como os **Empty Dirs** que são Volumes efêmeros que os dados são perdidos junto com a deleção da Pod, mas além deles, existem os **Persistent Volumes** que são Volumes que irão persistir os dados, independente do status da Pod.

Para compreender os Volumes, três fatores são os principais de serem entendidos:

- **Persistent Volumes**:

- **Storage Class**: 

- **Persistent Volume Claim**:
