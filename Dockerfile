FROM golang:1.10-alpine as builder
WORKDIR /go/src/github.com/combor/debug-app
ADD . .
RUN CGO_ENABLED=0 GOOS=linux go build -o debug-app .

FROM scratch
COPY --from=builder /go/src/github.com/combor/debug-app /
ENTRYPOINT ["/debug-app"]
