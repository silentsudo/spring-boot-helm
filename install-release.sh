#!/bin/bash

echo "Create new releases..."


eval $(minikube -p helm docker-env)

docker build -t silentsudo/spring-boot-helm .


helm install spring-boot-app-default deployment/ --values deployment/values.yaml
helm install spring-boot-app-dev deployment/ --values deployment/values.yaml -f deployment/values-dev.yaml -n dev
helm install spring-boot-app-prod deployment/ --values deployment/values.yaml -f deployment/values-prod.yaml -n prod
helm install spring-boot-app-qa deployment/ --values deployment/values.yaml -f deployment/values-qa.yaml -n qa

echo "Released!"
