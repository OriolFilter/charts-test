{{- define "template.configmap.tpl" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name | printf "%s-%s" .Chart.Name }}
  labels:
    name: {{ .Values.image.repository }}
data: {}
{{- end -}}
{{- define "template.configmap" -}}
{{- include "template.util.merge" (append . "template.configmap.tpl") -}}
{{- end -}}

