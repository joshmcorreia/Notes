# Cluster

[Cluster Architecture](https://kubernetes.io/docs/concepts/architecture/)

## View cluster events
```
$ kubectl get events
LAST SEEN   TYPE      REASON                              OBJECT                             MESSAGE
98s         Normal    Scheduled                           pod/hello-node-66d457cb86-wpjdw    Successfully assigned default/hello-node-66d457cb86-wpjdw to minikube
97s         Normal    Pulling                             pod/hello-node-66d457cb86-wpjdw    Pulling image "registry.k8s.io/e2e-test-images/agnhost:2.39"
90s         Normal    Pulled                              pod/hello-node-66d457cb86-wpjdw    Successfully pulled image "registry.k8s.io/e2e-test-images/agnhost:2.39" in 6.727s (6.727s including waiting). Image size: 126872991 bytes.                                                90s         Normal    Created                             pod/hello-node-66d457cb86-wpjdw    Created container agnhost
90s         Normal    Started                             pod/hello-node-66d457cb86-wpjdw    Started container agnhost
98s         Normal    SuccessfulCreate                    replicaset/hello-node-66d457cb86   Created pod: hello-node-66d457cb86-wpjdw
98s         Normal    ScalingReplicaSet                   deployment/hello-node              Scaled up replica set hello-node-66d457cb86 to 1
```
