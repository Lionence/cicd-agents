# DevOpsDani Azure Devops Self-Hosted Agent

## Docker
Run ./docker.sh to start running your agent.
  Usage:  setup.sh <--name NAME>     <--pat PAT>  <--pool AGENT_POOL>   <--path HOST_PATH>
Example:  setup.sh  --name devopsdani --pat 123yxz --pool temporary_pool --path /var/vsts/agent

## Kubernetes
For kubernetes deployment, please check https://github.com/devopsdani/k8s