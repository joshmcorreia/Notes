# Service

[Service](https://kubernetes.io/docs/concepts/services-networking/service/)

---

## Expose a Pod to the public internet
```
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
```

---

## View your services
```
kubectl get services
```
