FROM golang:alpine as builder

WORKDIR /go/docker-redirect

COPY . .
RUN go build 

FROM scratch
COPY --from=builder /go/docker-redirect/docker-redirect .

ENTRYPOINT ["/docker-redirect"]