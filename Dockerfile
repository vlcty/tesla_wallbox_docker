FROM golang:rc-alpine AS builder
RUN go install github.com/vlcty/tesla_wallbox_exporter@latest

FROM alpine:latest
RUN addgroup -S exporter && adduser -S exporter -G exporter
COPY --from=builder --chown=exporter:exporter /go/bin/tesla_wallbox_exporter /home/exporter/tesla_wallbox_exporter
EXPOSE 8420/tcp
USER exporter
ENTRYPOINT /home/exporter/tesla_wallbox_exporter
