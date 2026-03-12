{{/*
Expand the name of the chart.
*/}}
{{- define "example-app.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "example-app.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "example-app.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
