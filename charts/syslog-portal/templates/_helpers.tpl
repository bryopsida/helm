{{/*
Expand the name of the chart.
*/}}
{{- define "syslog-portal.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "syslog-portal.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "syslog-portal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "syslog-portal.labels" -}}
helm.sh/chart: {{ include "syslog-portal.chart" . }}
{{ include "syslog-portal.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "syslog-portal.selectorLabels" -}}
app.kubernetes.io/name: {{ include "syslog-portal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "syslog-portal.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "syslog-portal.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Default archiver credential name
*/}}
{{- define "syslog-portal.defaultArchiverSecretName" -}}
{{- printf "%s-archiver-credentials" .Release.Name }}
{{- end }}

{{/*
Lookup the right secret name for the archiver credentials
*/}}
{{- define "syslog-portal.archiverSecretName" -}}
{{- default (include "syslog-portal.defaultArchiverSecretName" .) .Values.archiver.existingSecret }}
{{- end }}