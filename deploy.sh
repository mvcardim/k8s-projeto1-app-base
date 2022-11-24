#!/bin/bash

echo "criando imagens"
docker build -t mvcardim/projeto-backend:1.0 backend/.

docker build -t mvcardim/projeto-database:1.0 database/.

echo "realizando o push das imagens"
docker push mvcardim/projeto-backend:1.0
docker push mvcardim/projeto-database:1.0

echo "criando servi�os no cluster kubernets"
kubectl apply -f ./services.ylm

echo "criando os deployments"
kubectl apply -f ./deployment.ylm





