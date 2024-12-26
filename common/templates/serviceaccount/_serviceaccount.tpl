{{- define "common.serviceaccount.tpl" -}}
{{ if .Values.serviceAccount.create }}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "common.serviceAccountName" . }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
  {{- with .Values.serviceAccount.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
automountServiceAccountToken: {{ .Values.serviceAccount.automount }}
{{- end -}}
{{- end -}}

{{- define "common.serviceaccount" -}}
{{- include "common.util.merge" (append . "common.serviceaccount.tpl") -}}
{{- end -}}
