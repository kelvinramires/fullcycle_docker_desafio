FROM golang:1.18-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o main cmd/main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

CMD ["./main"]
