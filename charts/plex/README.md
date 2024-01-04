# plex

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart to deploy plex with arr sidecars

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| bryopsida |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for schedulging |
| claimToken | string | `"CHANGE_ME"` | Plex claim token |
| configStorageClass | string | `nil` | Plex config storage class, if not set uses default storage class is used |
| configStorageSize | string | `"32Gi"` | Plex storage volume size |
| env | object | `{}` | Custom env vars for plex container |
| fullnameOverride | string | `""` | override full name |
| hostNetwork | bool | `false` | run plex on the node's network |
| image | object | `{"pullPolicy":"Always","repository":"ghcr.io/linuxserver/plex","tag":"latest"}` | plex image settings |
| imagePullSecrets | list | `[]` | If a pull secret is needed for you custom images |
| mediaStorageClass | string | `nil` | Plex media storage class |
| mediaStorageSize | string | `"256Gi"` | Plex media storage space |
| nameOverride | string | `""` | Override names |
| nodeSelector | object | `{}` | Scope to a specific node |
| overseerr.enabled | bool | `false` | Control running the overseerr sidecar |
| overseerr.env | object | `{}` | Custom env vars for overseerr container |
| overseerr.image | object | `{"pullPolicy":"Always","repository":"ghcr.io/linuxserver/overseerr","tag":"latest"}` | Control overseerr image settings |
| overseerr.port | int | `5055` | Listening port for overseerr |
| overseerr.resources | object | `{}` | Prowlarr resource overseerr, by default no limits |
| overseerr.virtualService | object | `{"clusterDomain":"cluster.local","enabled":false,"gateway":"istio-ingress/gateway","hosts":[]}` | virtual service settings for overseerr |
| overseerr.virtualService.clusterDomain | string | `"cluster.local"` | Set the cluster domain, the service reference is a FQDN |
| overseerr.virtualService.enabled | bool | `false` | Enable management of a istio virtual service |
| overseerr.virtualService.gateway | string | `"istio-ingress/gateway"` | Name of the istio ingress in this format <namespace>/<name> |
| overseerr.volumeMounts | list | `[]` | Mount extra volumes into the overseerr sidecar |
| podAnnotations | object | `{}` | custom annotations for pod |
| podSecurityContext | object | `{}` | security context for pod |
| prowlarr | object | `{"enabled":false,"env":{},"image":{"pullPolicy":"Always","repository":"ghcr.io/linuxserver/prowlarr","tag":"latest"},"resources":{},"volumeMounts":[]}` | Control prowlarr settings |
| prowlarr.enabled | bool | `false` | Control running the prowlarrr sidecar |
| prowlarr.env | object | `{}` | Custom env vars for prowlarr container |
| prowlarr.image | object | `{"pullPolicy":"Always","repository":"ghcr.io/linuxserver/prowlarr","tag":"latest"}` | Control prowlarr image settings |
| prowlarr.resources | object | `{}` | Prowlarr resource allocations, by default no limits |
| prowlarr.volumeMounts | list | `[]` | Mount extra volumes into the prowlarr sidecar |
| qbittorrent | object | `{"enabled":false,"env":{},"image":{"pullPolicy":"Always","repository":"ghcr.io/linuxserver/qbittorrent","tag":"latest"},"resources":{},"volumeMounts":[]}` | Control qbittorrent settings |
| qbittorrent.enabled | bool | `false` | Control running of the qbittorrent sidecar |
| qbittorrent.env | object | `{}` | Custom env vars for qbittorrent container |
| qbittorrent.image | object | `{"pullPolicy":"Always","repository":"ghcr.io/linuxserver/qbittorrent","tag":"latest"}` | Control qbitorrent image settings |
| qbittorrent.resources | object | `{}` | qbittorrent resource allocations, by default no limits |
| qbittorrent.volumeMounts | list | `[]` | Control the qbittorrent volume mounts |
| radarr | object | `{"enabled":false,"env":{},"image":{"pullPolicy":"Always","repository":"ghcr.io/linuxserver/radarr","tag":"latest"},"resources":{},"volumeMounts":[]}` | Control settings for the radarr sidecar |
| radarr.enabled | bool | `false` | Control whether the radarr side car runs |
| radarr.env | object | `{}` | Custom env vars for radarr container |
| radarr.image | object | `{"pullPolicy":"Always","repository":"ghcr.io/linuxserver/radarr","tag":"latest"}` | Control radarr image settings |
| radarr.resources | object | `{}` | Radarr resource allocations, by default no limits |
| radarr.volumeMounts | list | `[]` | Mount extra volumes into the radarr sidecar |
| resources | object | `{}` | Plex resource allocations, by default no limits |
| securityContext | object | `{}` | Security contexts for containers, will be applied to all containers |
| service | object | `{"port":32400,"type":"ClusterIP"}` | Plex service settings, by default cluster internal, change to load balancer to expose |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| sonarr | object | `{"enabled":false,"env":{},"image":{"pullPolicy":"Always","repository":"ghcr.io/linuxserver/sonarr","tag":"latest"},"resources":{},"volumeMounts":[]}` | Control settings for the sonarr sidecar |
| sonarr.enabled | bool | `false` | Enable the sonarr sidecar |
| sonarr.env | object | `{}` | Custom env vars for sonarr container |
| sonarr.image | object | `{"pullPolicy":"Always","repository":"ghcr.io/linuxserver/sonarr","tag":"latest"}` | Set where sonarr image settings |
| sonarr.resources | object | `{}` | Sonarr resource allocations, by default no limits |
| sonarr.volumeMounts | list | `[]` | Extra volume mounts for the container |
| timezone | string | `"US/Central"` | Timezone |
| tolerations | list | `[]` | Node taint tolerations |
| transcodeStorageClass | string | `nil` | Plex transcode storage class, if not set default storage class is used |
| transcodeStorageSize | string | `"64Gi"` | Plex transcode scratch space size |
| virtualService.clusterDomain | string | `"cluster.local"` | Set the cluster domain, the service reference is a FQDN |
| virtualService.enabled | bool | `false` | Enable management of a istio virtual service |
| virtualService.gateway | string | `"istio-ingress/gateway"` | Name of the istio ingress in this format <namespace>/<name> |
| virtualService.hosts | list | `[]` |  |
| volumeMounts | list | `[]` | Extra volume mounts for the plex container |
| volumes | list | `[]` | Extra volumes to mount to the pod, these will be available to all sidecars via volumeMounts |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
