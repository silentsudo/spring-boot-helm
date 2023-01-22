#!/bin/bash

echo "Deploying..."


./gradlew clean bootJar

eval $(minikube -p helm docker-env)


docker build -t silentsudo/spring-boot-helm .

#kubectl apply -f k8s/
#kubectl apply -k k8s/overlay/dev/
#kubectl apply -k k8s/overlay/qa/
#kubectl apply -k k8s/overlay/prod/

helm upgrade spring-boot-app-local deployment/ --values deployment/values.yaml
helm upgrade spring-boot-app-dev deployment/ --values deployment/values.yaml -f deployment/values-dev.yaml -n dev
helm upgrade spring-boot-app-qa deployment/ --values deployment/values.yaml -f deployment/values-qa.yaml -n qa
helm upgrade spring-boot-app-prod deployment/ --values deployment/values.yaml -f deployment/values-prod.yaml -n prod

echo "Deployed!"
