#!/bin/bash

echo "Deleting Helm release..."


eval $(minikube -p helm docker-env)

helm uninstall spring-boot-app-default
helm uninstall spring-boot-app-dev
helm uninstall spring-boot-app-qa
helm uninstall spring-boot-app-prod

echo "Deleted releases!"
