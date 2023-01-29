# scrypted

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for managing scrypted in Kubernetes

## Requirements

Kubernetes: `>= 1.20.0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Preferred nodes |
| fullnameOverride | string | `""` |  |
| hostNetwork | bool | `true` | Needs to be enabled for mDNS to function with devices outside of the kubernetes cluster |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"ghcr.io/koush/scrypted"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` | Optional pull secret if you use your own image that's in a private registry |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Target a node |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| ports | list | `[]` | Used to control container port mapping to host ports, needed for homekit pairing |
| resources | object | `{}` | Resource limits applied to the container |
| securityContext.capabilities.add | list | `["setuid","setgid","chown","DAC_OVERRIDE"]` | Add required linux sys capabilities back in, s6 escalates to root |
| securityContext.capabilities.drop | list | `["All"]` | Drop all linux sys capabilities |
| securityContext.readOnlyRootFilesystem | bool | `true` | Lock down the root file system |
| securityContext.runAsGroup | int | `2000` |  |
| securityContext.runAsUser | int | `2000` | Run as non root user |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| storage.className | string | `nil` | Optional storage class name, if not provided it uses the default storage class |
| storage.size | string | `"10Gi"` | Amount of storage space to allocate for scrypted local state, this is mapped to /server/volume |
| tolerations | list | `[]` | What taints this container can tolerate when making scheduling decisions |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)