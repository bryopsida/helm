# node-app

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A generic helm chart for a node app, load code into pod with `kubectl cp <app code foder> <pod name>:/app`. will automatically load new changes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| bryopsida |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Adjust pod affinity/grouping behavior on nodes |
| autoscaling | object | `{"enabled":false,"maxReplicas":100,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | Control auto scaling settings, if you need this, you must enable `manyPods: true` |
| clusterDomain | string | `"cluster.local"` |  |
| devSideCar | object | `{"dropbearPvcName":"dropbear","enabled":true,"homePvcName":"home","image":{"pullPolicy":"Always","repository":"ghcr.io/bryopsida/k8s-dev-pod","tag":"main"},"nvmInstallEnabled":true,"ohMyZshInstallEnabled":true,"passwordLoginEnabled":true,"resources":{},"sdkManInstallEnabled":true,"securityContext":{"runAsUser":1000},"service":{"enabled":true,"port":3022,"type":"ClusterIP"},"trustedPublicKeys":null}` | Control the sidecar that provides a drop bear ssh sidecar for VS Code Remote |
| devSideCar.dropbearPvcName | string | `"dropbear"` | set the name of the PVC holding the dropbear config files |
| devSideCar.enabled | bool | `true` | Enable the ssh sidecar, if you aren't making active live changes to your code you can disable this |
| devSideCar.homePvcName | string | `"home"` | set the name of the PVC holding the ssh user home fodler |
| devSideCar.nvmInstallEnabled | bool | `true` | install nvm |
| devSideCar.ohMyZshInstallEnabled | bool | `true` | install oh my zsh |
| devSideCar.passwordLoginEnabled | bool | `true` | Enable creating a random password on startup for the ssh user, once a public key has been copied this can/should be disabled |
| devSideCar.resources | object | `{}` | Set resources for the ssh/dev side car container |
| devSideCar.securityContext | object | `{"runAsUser":1000}` | Set security context settings for the ssh/dev side car container, you must take care when picking UID/GIDs to ensure the ssh user has permissions on the PVCs |
| devSideCar.service.enabled | bool | `true` | Enable a service object for ssh access to the dev side car |
| devSideCar.service.port | int | `3022` | Port to use for service |
| devSideCar.service.type | string | `"ClusterIP"` | Type of service, ClusterIP keeps internal, LoadBalancer exposes the service |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"node"` |  |
| image.tag | string | `"lts"` |  |
| imagePullSecrets | list | `[]` |  |
| initContainers[0] | object | `{"command":["node","/seed/seed.mjs"],"image":"node:lts","name":"seed-container","volumeMounts":[{"mountPath":"/seed","name":"seed"},{"mountPath":"/app","name":"app-code","subPath":"app-code"},{"mountPath":"/home/node/.npm","name":"npm-cache","subPath":"npm-cache"}]}` | seed container, this copies in the pacßkage.json, package-lock.json, and index.js to kick start server that passes health checks    the intent is this can be changed live and persisted in the app-code pvc as you make changes through the dev side car, when     you finish making changes for a cycle you can disable the dev side car. If the ability to rollback is important to you, use a storage    system with snapshotting and rollback. |
| managedStorage | object | `{"app-code":{"size":"1Gi"},"dropbear":{"size":"256Mi"},"home":{"size":"10Gi"},"node-modules":{"size":"5Gi"},"npm-cache":{"size":"5Gi"}}` | Map of storage volumes managed by the helm release |
| managedStorage.app-code | object | `{"size":"1Gi"}` | PVC to hold application specific code |
| managedStorage.dropbear | object | `{"size":"256Mi"}` | PVC to persist dropbear config such as public keys |
| managedStorage.home | object | `{"size":"10Gi"}` | PVC to hold SSH user home folder |
| managedStorage.node-modules | object | `{"size":"5Gi"}` | PVC to hold node modules |
| managedStorage.npm-cache | object | `{"size":"5Gi"}` | PVC to hold npm cache |
| manyPods | bool | `false` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Control what node(s) pods can be scheduled on |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` | Set resource allocations for the service/app container |
| securityContext | object | `{"runAsNonRoot":true,"runAsUser":1000}` | Set security context settings for the service/app container |
| service.port | int | `3000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` | Control what taints these workloads can tolerate |
| virtualService.enabled | bool | `false` |  |
| virtualService.gateway | string | `"istio-ingress/default-gateway"` |  |
| virtualService.hostname | string | `"node.example.com"` |  |
| volumeMounts | list | `[{"mountPath":"/app","name":"app-code","subPath":"app-code"},{"mountPath":"/app/.npm","name":"npm-cache","subPath":"npm-cache"},{"mountPath":"/.npm","name":"npm-cache","subPath":"npm-cache"},{"mountPath":"/app/node_modules","name":"node-modules","subPath":"node-modules"}]` | Mount volumes onto containers |
| volumes[0].configMap.name | string | `"seed-config"` |  |
| volumes[0].name | string | `"seed"` |  |
| volumes[1].name | string | `"app-code"` |  |
| volumes[1].persistentVolumeClaim.claimName | string | `"app-code"` |  |
| volumes[2].name | string | `"npm-cache"` |  |
| volumes[2].persistentVolumeClaim.claimName | string | `"npm-cache"` |  |
| volumes[3].name | string | `"node-modules"` |  |
| volumes[3].persistentVolumeClaim.claimName | string | `"node-modules"` |  |
| volumes[4].name | string | `"home"` |  |
| volumes[4].persistentVolumeClaim.claimName | string | `"home"` |  |
| volumes[5].name | string | `"dropbear"` |  |
| volumes[5].persistentVolumeClaim.claimName | string | `"dropbear"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.12.0](https://github.com/norwoodj/helm-docs/releases/v1.12.0)
