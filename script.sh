#!/bin/bash

echo "Criando as imagens......"

docker build -t valdeckgally/projeto-k8s:1.0 backend/.
docker build -t valdeckgally/projeto-database:1.0 database/.

echo "Realizando o push das imagens....."

docker push valdeckgally/projeto-backend:1.0
docker push valdeckgally/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes"

kubectl apply -f ./services.yml

echo "criando os deployments...."

kubeclt apply -f ./deployment.yml
