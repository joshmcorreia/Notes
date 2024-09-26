# Minikube

[Minikube documentation](https://minikube.sigs.k8s.io/docs/)


## Accessing the minikube dashboard remotely
[How to access local Kubernetes minikube dashboard remotely?](https://stackoverflow.com/a/53346813)

On the computer running minikube, open up a new terminal window and copy/paste the following:
```none
kubectl proxy --address='0.0.0.0' --disable-filter=true
```
