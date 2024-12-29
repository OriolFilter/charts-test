helm dependency update prowlarr && \
helm dependency update qbittorrent && \
helm dependency update sonarr && \
helm dependency update radarr && \
helm dependency update bazarr && \
helm dependency update readarr && \
helm dependency update flaresolverr && \
helm install flaresolverr flaresolverr/ --debug --dry-run

#helm dependency update basetemplate && \
#helm install basetemplate basetemplate/ --debug --dry-run
