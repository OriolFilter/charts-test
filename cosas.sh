helm dependency update prowlarr && \
helm dependency update qbittorrent && \
helm dependency update sonarr && \
helm dependency update radarr && \
helm dependency update bazarr && \
helm dependency update readarr && \
helm install readarr readarr/ --debug --dry-run

#helm dependency update basetemplate && \
#helm install basetemplate basetemplate/ --debug --dry-run
