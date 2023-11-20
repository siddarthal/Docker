FROM golang:1.16-alpine
RUN apk update && apk add --no-cache gcc musl-dev
WORKDIR /usr/src/app
COPY . .
RUN go build
RUN go test ./...
EXPOSE 8080
ENTRYPOINT ["./server"]