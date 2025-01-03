{{- define "common.service.tpl" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http- {{- .Values.service.port }}
      protocol: TCP
      name: http
  selector:
    {{- include "common.selectorLabels" . | nindent 4 }}
{{- end -}}

{{- define "common.service" -}}
{{- include "common.util.merge" (append . "common.service.tpl") -}}
{{- end -}}
