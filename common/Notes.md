# Usage

## Dependency

Append the following snipped code on the chart that wants to add this template as a dependency

```yaml
# Chart.yaml
dependencies:
  - name: common
    version: 0.1.0
    repository: file://../common
    import-values:
      - defaults
```

## Objects

Create files such as the following, where the *new* chart is responsible on controlling weather the objects will be created or not. (for now). 

The metadata.labels.  etc  is an example of merging the base template with additional values.
```yaml
# templates/serviceaccount.yaml
{{- include "common.serviceaccount" (list . "prowlarr.serviceaccount") -}}
{{- define "prowlarr.serviceaccount" -}}
# Add space
metadata:
  labels:
    app.kubernetes.io/instance: myprowlarr
{{- end -}}
```

This will create the following yaml:

```yaml
# Source: prowlarr/templates/serviceaccount/serviceaccount.yaml
apiVersion: v1
automountServiceAccountToken: true
kind: ServiceAccount
metadata:
  labels:
    app.kubernetes.io/instance: myprowlarr
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: prowlarr
    app.kubernetes.io/version: 1.28.2
    helm.sh/chart: prowlarr-0.1.0
  name: myprowlarr
```