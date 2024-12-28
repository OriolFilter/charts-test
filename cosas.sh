helm dependency update prowlarr && \
helm dependency update qbittorrent && \
helm dependency update sonarr && \
helm dependency update radarr && \
helm install qbittorrent qbittorrent/ --debug --dry-run

#helm dependency update basetemplate && \
#helm install basetemplate basetemplate/ --debug --dry-run
