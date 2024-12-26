{{- define "common.service.tpl" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "base.fullname" . }}
  labels:
    {{- include "base.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "base.selectorLabels" . | nindent 4 }}
{{- end -}}

{{- define "common.service" -}}
{{- include "common.util.merge" (append . "common.service.tpl") -}}
{{- end -}}
