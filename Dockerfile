# PolicyEngine household API behind a bearer-token check (Caddy).
# Bump PE_TAG to move to a new policyengine-us model version.
ARG PE_TAG=us-2.116.16
FROM caddy:2 AS caddy
FROM ghcr.io/policyengine/policyengine-household-api:${PE_TAG}
COPY --from=caddy /usr/bin/caddy /usr/bin/caddy
COPY --chmod=755 Caddyfile run.sh /app/
CMD ["/app/run.sh"]
