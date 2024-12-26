{{- define "common.persistentvolumeclaim.tpl" -}}
{{- if .Values.persistence.enabled -}}
{{- if not .Values.persistence.existingClaim -}}
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ include "common.provisionedPvcName" . }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
spec:
  accessModes:
  {{- range .Values.persistence.accessModes }}
    - {{ . | nindent 6 }}
  {{- end }}
  resources:
    requests:
      storage: {{ .Values.persistence.requests }}
  storageClassName: {{ .Values.persistence.storageClassName }}
{{- end }}
{{- end }}
{{- end }}

{{- define "common.persistentvolumeclaim" -}}
{{- include "common.util.merge" (append . "common.persistentvolumeclaim.tpl") -}}
{{- end -}}
