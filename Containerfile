FROM docker.io/library/caddy:2.11.9-builder-alpine@sha256:86e132d1d6db8850352b2dbc15f82a4cb25363ac305ee41e11405873e5931f37 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@v0.2.4

FROM docker.io/library/caddy:2.11.9-alpine@sha256:003a97808e781aa9f7e75cc2f43d34d461099031faf5e20faefb9f61126836f0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

USER caddy

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s CMD wget --no-verbose --tries=1 --spider http://localhost:8888/health || exit 1
