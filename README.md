# Infrastructure and Cloud Computing
# Professor: Jo�o Henrique Victorino da Silva 
# Aluno: Vinicius Miranda Lopes Schulz

## Atividade 4
### Decri��o
Subir dois pods, nginx e mysql, mapeando a porta 80 do nginx para acesso externo ao cluster e permitir que o cont�iner do nginx tenha comunica��o de rede no cont�iner mysql pela porta 3306. A atividade pode ser feita localmente (minikube), AKS (Azure), EKS (AWS) ou no GKE (GCP). Se quiser criar o cluster nuvem Kubernetes com Terraform � opcional. Enviar os arquivos yaml pelo GitHub.

## Instala��o

### Instalar Kubernetes - Windows, Mac ou Linux

####Instala��o no Windows

[Windows](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/)

####Instala��o no Linux

[Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

####Instala��o no macOS

[macOS](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)

### Instalar Azure Cli - Windows, Mac ou Linux

[Azure Cli](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli)


## Provisionando o Cluster na Azure com Terraform

1 - Abra o Terminal, cmd ou PowerShell

2 - Clone o projeto usando o comando:

`git clone https://github.com/vinicius-schulz/kubernetes-terraform.git`


3 - Navegue para o diret�rio clonado

4 - Logue no conta do Azure

`az login -u <email> -p <senha>`

5 - Execute o comando abaixo para inicializar um projeto terraform no diret�rio corrente

`terraform init`

6 - Execute o comando abaixo para visualizar as modifica��es que o terraform far� na sua conta Azure

`terraform plan`

7 - Execute o comando abaixo para criar o cluster na sua conta da Azure. Aguarde a cria��o.

`terraform apply -auto-approve`

8 - Entre na sua conta da Azure e verifique se o resource group e o cluster foram criados respectivamente, 'ResourceGroupTask4' e 'KubernetesClusterTask4'.


## Realizando deploy no Cluster criado

1 - A partir do terminal, conecte-se ao cluster criado na azure

`az aks get-credentials --resource-group ResourceGroupTask4 --name KubernetesClusterTask4`

2 - Suba os deployments criados a partir dos arquivos yaml

`kubectl apply -f .\deployments\`

3 - Suba os servi�os criados a partir dos arquivos yaml

`kubectl apply -f .\services\`

4 - Execute o comando para verificar o status dos Pods, Servi�os criados e o endere�o ip externo (EXTERNAL-IP em service/frontend-svc) para conectar-se ao cluster (IP P�blico)

`kubectl get all`

5 - Pelo navegador, acesse o IP obtido no passo anterior, em caso de sucesso nos procedimentos anteriores, o navegador dever� redirecionar a pagina para a home do nginx

## Desprovisionando Cluster

1 - Execute o comando abaixo para destruir a infraestrutura criada pelo terraform

`terraform destroy`

## Dicas de resolu��o de problemas encontrados durante o desenvolvimento da atividade

### Conta Azure n�o possuia alguns Resources providers registrados para uso

Resolu��o: executei os comando abaixo para o Resources providers sem registro

`az provider register --namespace Microsoft.ContainerService`