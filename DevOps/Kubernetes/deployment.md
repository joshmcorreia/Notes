# Deployment

[Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

## Create a test deployment
```
$ kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080
```

## View all deployments
```
$ kubectl get deployments
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
hello-node   1/1     1            1           55s
```
