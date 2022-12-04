FROM golang:1.19.2-alpine3.16 AS builder
COPY . /workspace
WORKDIR /workspace
ENV CGO_ENABLED=0
RUN go build -o /workspace/go-pmtiles
FROM alpine
COPY --from=builder /workspace/go-pmtiles /bin/pmtiles
WORKDIR /workspace
EXPOSE 8080
ENTRYPOINT ["/bin/sh"]
