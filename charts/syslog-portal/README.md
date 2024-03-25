# syslog-portal

![Version: 0.3.1](https://img.shields.io/badge/Version-0.3.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

A Helm chart to launch a syslog-portal for ingesting syslog streams

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| bryopsida |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| archiver.authEnabled | bool | `false` | Toggle usage of auth in the archiver |
| archiver.databaseFolder | string | `"/opt/syslog-portal/data"` | The location of the local database store when using the POUCHDB archiver |
| archiver.enabled | bool | `false` | Toggle archiving the data to a remote system, if disabled stdout is the destination |
| archiver.existingSecret | string | `nil` | Name of an existing secret |
| archiver.hostname | string | `nil` | Hostname of the remote destination targetted by the archiver |
| archiver.partitionKeyPriorityList | list | `["app","hostname","severity"]` | List of keys, in order of priority, that will be used for partition keys if applicable |
| archiver.password | string | `nil` | Password for the remote destination of the archiver |
| archiver.passwordFile | string | `nil` | Path to a password file |
| archiver.port | int | `27017` | Destination port targetted by the archiver |
| archiver.syncInterval | int | `300000` | Controls the interval between syncs to the remote dabase when using the POUCHDB archiver |
| archiver.type | string | `"MONGO"` | Set the type of archiver, can be MONGO or POUCHDB |
| archiver.username | string | `nil` | Username for the remote destination of the archiver |
| archiver.usernameFile | string | `nil` | Path to a username file |
| autoscaling.enabled | bool | `true` |  |
| autoscaling.maxReplicas | int | `10` |  |
| autoscaling.minReplicas | int | `3` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"ghcr.io/bryopsida/syslog-portal"` |  |
| image.tag | string | `"main"` |  |
| imagePullSecrets | list | `[]` |  |
| logLevel | string | `"info"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations."prometheus.io/port" | string | `"9091"` |  |
| podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"256m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"256m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| service.port | int | `514` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.12.0](https://github.com/norwoodj/helm-docs/releases/v1.12.0)