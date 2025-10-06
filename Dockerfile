FROM golang:latest
WORKDIR /galah
COPY . .
RUN <<EOF
go mod download
go build -o galah ./cmd/galah
EOF
EXPOSE 8080
EXPOSE 443
ENTRYPOINT ["./galah/galah"]