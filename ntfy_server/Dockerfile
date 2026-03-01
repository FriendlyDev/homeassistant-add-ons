ARG BUILD_VERSION
FROM binwiederhier/ntfy:$BUILD_VERSION

COPY config/server.yml /server.yml.default

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["ntfy", "serve"]

HEALTHCHECK \
  --interval=60s \
  --timeout=10s \
  --retries=3 \
  --start-period=40s \
  CMD wget -q --tries=1 http://localhost:80/v1/health -O - | grep -Eo '"healthy":\s*true' || exit 1
