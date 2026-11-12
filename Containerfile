FROM docker.io/library/caddy:2.11.9-builder-alpine@sha256:646fee578e680989ca5c7fd1ce6f1de574d19fd71ef2221810cc0510a9f40c86 AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@v0.2.4

FROM docker.io/library/caddy:2.11.9-alpine@sha256:0bbb055bda6793c999bde78b1b5ce3e89f829fb031af2cf50056ea1246559fee

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

USER caddy

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s CMD wget --no-verbose --tries=1 --spider http://localhost:8888/health || exit 1
