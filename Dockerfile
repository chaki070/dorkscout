FROM golang:alpine AS builder

RUN apk update
RUN apk add --no-cache \
        libc6-compat


WORKDIR /dorkscout

RUN go install github.com/chaki070/dorkscout@latest
RUN dorkscout install -o .


FROM alpine:edge
COPY --from=builder /go/bin/dorkscout /bin/dorkscout
COPY --from=builder /dorkscout/* /dorkscout/

ENTRYPOINT ["dorkscout"]
