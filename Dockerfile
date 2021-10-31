FROM golang:latest
EXPOSE 8420/tcp
RUN go install github.com/vlcty/tesla_wallbox_exporter@latest
ENTRYPOINT /go/bin/tesla_wallbox_exporter
