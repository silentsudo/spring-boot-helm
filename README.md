## Setup

Execute `./gradlew clean bootJar` from the root directory of the project.

### Run Locally

Run application using `./gradlew bootJar`

Navigate to http://localhost:8080/default this should give

```json
{
  "appName": "Helm Local",
  "status": "ok"
}
```

### Setup Minikube using

This creates new minikube profile named helm

```shell
minikube start -p helm
```

Add ingress addons using

```shell
minikube -p helm addons enable ingress
```

Navigate to Dashboard using

```shell
minikube dashboard -p helm
```

## Add namespace to kubernetes

```shell
kubectl create namespace dev
kubectl create namespace qa
kubectl create namespace prod
```

### Deploy all variants to the cluster

Execute following script to create release

```shell
./initial-release.sh
```

### Remove all variant deployment

Execute following script to create release

```shell
./uninstall-release.sh
```