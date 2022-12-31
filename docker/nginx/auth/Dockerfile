FROM golang
WORKDIR /go/src/github.com/yadsyah/auth
COPY main.go .
RUN go build main.go
EXPOSE 8080
ENTRYPOINT ["./main"]